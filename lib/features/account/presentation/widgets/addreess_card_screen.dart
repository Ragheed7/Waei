import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:waie/features/account/presentation/edit_address_screen.dart';

class AddressCardScreen extends StatelessWidget {
  final Address address;
  final int counter;

  const AddressCardScreen({
    Key? key,
    required this.address,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Address Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Address ${counter+1}',
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAddressScreen(address: address),
                    ),
                  );
                },
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(118, 192, 67, 1),
                  ),
                ),
              ),
            ],
          ),
          Text(address.country, style: TextStyle(fontSize: 16),),
          Text(address.state, style: TextStyle(fontSize: 16)),
          Text(address.city, style: TextStyle(fontSize: 16)),
          Text(address.streetAddress, style: TextStyle(fontSize: 16)),
          Text(address.zipCode, style: TextStyle(fontSize: 16)),
          verticalSpace(10)
        ],
      ),
    );
  }
}
