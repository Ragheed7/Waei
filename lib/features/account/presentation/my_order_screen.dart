import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/account/presentation/widgets/order_info_screen.dart';
import 'package:waie/features/cart/logic/order%20logic/get_orders_cubit.dart';
import 'package:waie/features/cart/logic/order%20logic/get_orders_state.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GetOrdersCubit>()..fetchOrders(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarScreen(title: 'My Orders'),
        body: BlocBuilder<GetOrdersCubit, GetOrdersState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: Text('No orders fetched.')),
              loading: () => Center(child: CircularProgressIndicator()),
              success: (data) {
                if (data.result.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/warning-2.png", height: 120, width: 180,),
                        SizedBox(height: 20,),
                        Text('No orders found.', style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  padding: EdgeInsets.all(20),
                  itemCount: data.result.length,
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    return OrderInfoScreen(order: data.result[index]);
                  },
                );
              },
              failure: (error) => Center(child: Text(error)),
            );
          },
        ),
      ),
    );
  }
}
