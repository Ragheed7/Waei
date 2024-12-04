import 'package:flutter/material.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/get_addresses.dart';

class DeliveryAddressSectionScreen extends StatelessWidget {
  final Address address;

  const DeliveryAddressSectionScreen({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address.streetAddress,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "${address.city}, ${address.state} ${address.zipCode}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            address.country,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
