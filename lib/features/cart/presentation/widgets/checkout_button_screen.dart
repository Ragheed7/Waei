import 'package:flutter/material.dart';
import 'package:waie/features/cart/presentation/check_out_screen.dart';

class CheckoutButtonScreen extends StatelessWidget {
  const CheckoutButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckOutScreen()),
          );
        },
        color: Color.fromRGBO(118, 192, 67, 1),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 16,
        ),
        child: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'cabin',
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minWidth: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}
