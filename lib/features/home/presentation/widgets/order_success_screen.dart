import 'package:flutter/material.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/features/home/presentation/widgets/container_button_model.dart';


class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/ok.png",
                height: 250,
              ),
              SizedBox(height: 15),
              Text(
                "Success",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Your request has been submitted",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.navigationMenu);
              },
              child: ContainerButtonModel(
                itext: "Continue Shopping",
                containerWidth: MediaQuery.of(context).size.width,
                bgColor:Color.fromRGBO(118, 192, 67, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
