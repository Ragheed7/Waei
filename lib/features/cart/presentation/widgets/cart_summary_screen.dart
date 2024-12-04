import 'package:flutter/material.dart';

class CartSummaryScreen extends StatelessWidget {
  final int itemCount;
  final double totalPrice;

  const CartSummaryScreen({
    Key? key,
    required this.itemCount,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 80,
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
      child: Center(
        child: Text(
          "$itemCount items: Total (excluding delivery) SAR ${totalPrice.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
