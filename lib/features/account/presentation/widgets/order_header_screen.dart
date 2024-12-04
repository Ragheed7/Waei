import 'package:flutter/material.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/order.dart';

class OrderHeaderScreen extends StatelessWidget {
  final Order order;

  OrderHeaderScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order ID: ${order.orderId}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: ${_getStatusText(order.status)}",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 5),
        Text(
          "Created At: ${_formatDate(order.createdAt)}",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 5),
        Text(
          "Shipping Status: ${_getShippingStatusText(order.shippingStatus)}",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    // Date format DD/MM/YYYY
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  String _getStatusText(int status) {
    switch (status) {
      case 1:
        return "Pending";
      case 2:
        return "Processing";
      case 3:
        return "On the way";
      case 4:
        return "Delivered";
      default:
        return "Unknown";
    }
  }

  String _getShippingStatusText(int shippingStatus) {
    switch (shippingStatus) {
      case 1:
        return "Not Shipped";
      case 2:
        return "Shipped";
      case 3:
        return "In Transit";
      case 4:
        return "Delivered";
      default:
        return "Unknown";
    }
  }
}
