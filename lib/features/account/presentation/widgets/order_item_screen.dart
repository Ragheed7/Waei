import 'package:flutter/material.dart';

class OrderItemScreen extends StatelessWidget {
  final String image;
  final String title;
  final List<String> details; 
  final String price;

  OrderItemScreen({
    required this.image,
    required this.title,
    required this.details,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/images/waie2.png",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(width: 10),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                ...details.map((detail) => Text(
                      detail,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    )),
              ],
            ),
          ),
          // Price
          Text(
            price,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
