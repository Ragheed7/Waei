import 'package:flutter/material.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/order.dart';
import 'package:waie/features/cart/data/model/order_models/sub_order_models/transaction.dart';
import 'package:waie/features/cart/presentation/widgets/order_confirmation_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    // Extract data from the order
    final imageList = order.orderItems
        .map((item) => item.product.images!.isNotEmpty
            ? (ApiConsts.serverBaseUrl + item.product.images![0].imageUrl!)
            : "assets/images/waie2.png")
        .toList();
    final productTitles = order.orderItems
        .map((item) => item.product.nameEn ?? "Product")
        .toList();
    final prices = order.orderItems
        .map((item) => "SAR ${item.product.price?.toStringAsFixed(2)}")
        .toList();
    final contentDetails = order.orderItems
        .map((item) =>
            [item.product.descriptionEn ?? "No description available."])
        .toList();

    double totalPayment =
        order.totalPrice + SharedPrefKeys.deliveryFee; 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Order Details"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Divider(),
                // Order Header
                Text(
                  "Order #${order.orderId}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                // Delivery Address
                Container(
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
                        order.shippingAddress.streetAddress,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "${order.shippingAddress.city}, ${order.shippingAddress.state} ${order.shippingAddress.zipCode}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        order.shippingAddress.country,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Order Status
                Text(
                  "Order Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Container(
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
                        "Created at: ${_formatDate(order.createdAt)}",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Order Status: ${_getStatusText(order.status)}",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Shipping Status: ${_getShippingStatusText(order.shippingStatus)}",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Payment Status: ${_getTransactionStatus(order.transaction)}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Order Items Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Items",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${order.orderItems.length} items",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // List of Order Items
                ListView.builder(
                  itemCount: order.orderItems.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        imageList[index] ?? "assets/images/waie2.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/waie2.png',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      title: Text(productTitles[index]),
                      subtitle: Text(contentDetails[index].join('\n')),
                      trailing: Text(prices[index]),
                    );
                  },
                ),
                SizedBox(height: 20),
                // Order Summary
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Payment",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                SizedBox(height: 20),
                // Check if the order is unpaid
                if (order.transaction == null)
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the payment confirmation screen with the Order object
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderConfirmationScreen(order: order),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(118, 192, 67, 1),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.3,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        "Pay Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'cabin',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _formatDate(DateTime date) {
  // Format the date as needed, e.g., DD/MM/YYYY
  return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
}

String _getStatusText(int status) {
  // Map status codes to readable text
  switch (status) {
    case 0:
      return "Processing";
    case 1:
      return "Completed";
    case 2:
      return "Canceled";
    default:
      return "Unknown";
  }
}

String _getShippingStatusText(int status) {
  // Map status codes to readable text
  switch (status) {
    case 0:
      return "Not Shipped yet";
    case 1:
      return "In Transit";
    case 2:
      return "Out For Delivery";
    case 3:
      return "Delivered";
    case 4:
      return "Failed Delivery";
    default:
      return "Unknown";
  }
}

String _getTransactionStatus(Transaction? transt) {
  // Map status codes to readable text
  if (transt == null) {
    return "Not paid yet";
  } else {
    return "Paid";
  }
}
