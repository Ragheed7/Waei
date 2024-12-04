import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  final List<Map<String, String>> items;
  final String total;

  OrderSummaryScreen({required this.items, required this.total});

  @override
  Widget build(BuildContext context) {
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
            Text("Total Payment", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            Text(
              total,
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
