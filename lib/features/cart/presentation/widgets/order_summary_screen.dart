import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  final double itemsTotal;
  final double deliveryFee;
  final double totalPayment;

  const OrderSummaryScreen({
    Key? key,
    required this.itemsTotal,
    required this.deliveryFee,
    required this.totalPayment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"label": "Items Total", "price": "SAR ${itemsTotal.toStringAsFixed(2)}"},
      {"label": "Delivery", "price": "SAR ${deliveryFee.toStringAsFixed(2)}"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item["label"]!, style: TextStyle(fontSize: 15)),
                  Text(item["price"]!, style: TextStyle(fontSize: 15)),
                ],
              ),
            )),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Payment",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              "SAR ${totalPayment.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(118, 192, 67, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
