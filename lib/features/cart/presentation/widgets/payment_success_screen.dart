import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/navigation_menu.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final int orderId;

  const PaymentSuccessScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the back button to prevent navigating back to the confirmation screen
      appBar: AppBar(
        title: Text("Payment Successful"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              color: ColorsManager.mainGreen,
              size: 120,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your payment for Order #$orderId was successful!",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => BottomNavBar()),
                  (Route<dynamic> route) => false,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(118, 192, 67, 1),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.3,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
