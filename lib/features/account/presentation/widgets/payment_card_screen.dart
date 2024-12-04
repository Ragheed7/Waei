import 'package:flutter/material.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';
import 'package:waie/core/local_models/payment_model/payment_card_manager.dart';
import 'package:waie/features/account/presentation/edit_payment_screen.dart';

class PaymentCardScreen extends StatelessWidget {
  final PaymentCard paymentCard;
  final int cardIndex;
  final VoidCallback onDelete;
  final bool isSelected; // Indicates if the card is selected
  final String userId;

  const PaymentCardScreen({
    Key? key,
    required this.paymentCard,
    required this.cardIndex,
    required this.onDelete,
    this.isSelected = false,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: isSelected
            ? Border.all(color: Colors.blue, width: 2)
            : Border.all(color: Colors.transparent),
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
          // Card Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Card ${cardIndex + 1}",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      bool? result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPaymentScreen(
                            cardIndex: cardIndex,
                            userId: userId,
                          ),
                        ),
                      );
                      if (result == true) {
                        // Refresh the payment cards list if needed
                        (context as Element).markNeedsBuild();
                      }
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(118, 192, 67, 1),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      bool shouldDelete = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text('Confirm Deletion'),
                                content: Text(
                                    'Are you sure you want to delete this payment card?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(false); // User cancels deletion
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(true); // User confirms deletion
                                    },
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false; // In case the dialog is dismissed without a choice

                      // If the user confirms the deletion
                      if (shouldDelete) {
                        await PaymentCardManager()
                            .deletePaymentCard(cardIndex, userId);
                        onDelete();
                      }
                    },
                  )
                ],
              ),
            ],
          ),

          // Display Masked Card Number
          Text(
            "Card Number: ${paymentCard.maskedCardNumber}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Card Holder: ${paymentCard.cardHolderName}",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            "Expiry: ${paymentCard.expiryMonth.toString().padLeft(2, '0')}/${paymentCard.expiryYear.toString().padLeft(2, '0')}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
