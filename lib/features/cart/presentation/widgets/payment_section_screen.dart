import 'package:flutter/material.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';

class PaymentSectionScreen extends StatefulWidget {
  final PaymentCard paymentCard;
  final Function(String cvv) onCvvChanged;

  const PaymentSectionScreen({
    Key? key,
    required this.paymentCard,
    required this.onCvvChanged,
  }) : super(key: key);

  @override
  _PaymentSectionScreenState createState() => _PaymentSectionScreenState();
}

class _PaymentSectionScreenState extends State<PaymentSectionScreen> {
  final TextEditingController _cvvController = TextEditingController();
  String? _cvvError;

  @override
  void initState() {
    super.initState();
    _cvvController.addListener(_onCvvChanged);
  }

  @override
  void dispose() {
    _cvvController.removeListener(_onCvvChanged);
    _cvvController.dispose();
    super.dispose();
  }

  void _onCvvChanged() {
    final cvv = _cvvController.text;
    if (!RegExp(r'^\d{3}$').hasMatch(cvv)) {
      setState(() {
        _cvvError = "CVV must be 3 digits";
      });
    } else {
      setState(() {
        _cvvError = null;
      });
    }
    widget.onCvvChanged(cvv);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "Card Number: ${widget.paymentCard.maskedCardNumber}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Card Holder: ${widget.paymentCard.cardHolderName}",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            "Expiry: ${widget.paymentCard.expiryMonth.toString().padLeft(2, '0')}/${widget.paymentCard.expiryYear}",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          // CVV Input Field
          TextField(
            controller: _cvvController,
            keyboardType: TextInputType.number,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: "CVV",
              hintText: "Enter CVV",
              errorText: _cvvError,
              border: OutlineInputBorder(),
            ),
            maxLength: 3,
          ),
        ],
      ),
    );
  }
}
