import 'package:flutter/material.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/shipping_address.dart';

class DeliveryAddressScreen extends StatelessWidget {
  final ShippingAddress address;

  DeliveryAddressScreen({required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivery Address",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Text(
          "${address.streetAddress},",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "${address.city}, ${address.state},",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "${address.country} - ${address.zipCode}",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
