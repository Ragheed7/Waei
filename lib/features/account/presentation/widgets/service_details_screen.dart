import 'package:flutter/material.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/features/home/data/model/services/get_user_services.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceRequest service;

  // Constructor to receive the selected service
  ServiceDetailsScreen({required this.service});

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
    final serviceStatus = getServiceStatus(service.serviceRequestStatus);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Service #${service.requestId} Details',
          style: TextStyle(
            fontFamily: 'cabin',
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Service ID: ${service.requestId}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Product Details: ${service.productDetails}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Requested Price: \$${service.requestedPrice}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Purchase Price: \$${service.purchasePrice}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Status: $serviceStatus',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _getStatusColor(service.serviceRequestStatus),
              ),
            ),
            SizedBox(height: 16),
            if (service.responseDetails != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Response Details:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    service.responseDetails!,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            if (service.images.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Images:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: service.images.length,
                      itemBuilder: (context, index) {
                        final image = service.images[index];
                        final fullImageUrl =
                            '${ApiConsts.serverBaseUrl}${image.imageUrl}'; // Prepend the server base URL

                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.network(
                            fullImageUrl, // Use the complete image URL
                            fit: BoxFit.cover,
                            width: 150,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ],
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
