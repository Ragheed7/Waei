import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/account/presentation/widgets/service_details_screen.dart';
import 'package:waie/features/home/data/repository/get_user_services_repo.dart';
import 'package:waie/features/home/logic/cubit/get_user_services_cubit.dart';
import 'package:waie/features/home/logic/cubit/get_user_services_state.dart';

class MyServices extends StatelessWidget {
  // Method to convert the serviceRequestStatus to a readable string
  String getServiceStatus(int status) {
    switch (status) {
      case 0:
        return 'New';
      case 1:
        return 'In Progress';
      case 2:
        return 'Resolved';
      case 3:
        return 'Rejected';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetUserServicesCubit(getIt<GetUserServicesRepository>())
        ..fetchUserServices(),
      child: Scaffold(
        appBar: AppBarScreen(title: 'My Services'),
        body: BlocBuilder<GetUserServicesCubit, GetUserServicesState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: Text('Loading Services...')),
              loading: () => Center(child: CircularProgressIndicator()),
              success: (data) {
                if (data.result.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/warning-2.png", height: 120, width: 180,),
                        SizedBox(height: 20,),
                        Text('No Services found.', style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: data.result.length,
                  itemBuilder: (context, index) {
                    final service = data.result[index];
                    final serviceStatus = getServiceStatus(service.serviceRequestStatus);

                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          'Service #${service.requestId}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.productDetails,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Status: $serviceStatus',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: _getStatusColor(service.serviceRequestStatus),
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigate to the service details screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ServiceDetailsScreen(service: service),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              failure: (error) => Center(child: Text('Error: $error')),
            );
          },
        ),
      ),
    );
  }

  // Helper method to map service status to a color
  Color _getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.blue; // New
      case 1:
        return Colors.orange; // In Progress
      case 2:
        return Colors.green; // Resolved
      case 3:
        return Colors.red; // Rejected
      default:
        return Colors.black; // Default color for unknown status
    }
  }
}
