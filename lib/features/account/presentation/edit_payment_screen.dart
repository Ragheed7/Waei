import 'package:flutter/material.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';
import 'package:waie/core/local_models/payment_model/payment_card_manager.dart';
import 'package:waie/features/account/presentation/widgets/card_number_input_formatter.dart';
import 'package:waie/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';

class EditPaymentScreen extends StatefulWidget {
  final int cardIndex;
  final String userId; 

  const EditPaymentScreen({super.key, required this.cardIndex, required this.userId});

  @override
  _EditPaymentScreenState createState() => _EditPaymentScreenState();
}

class _EditPaymentScreenState extends State<EditPaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController cardNumberController;
  late TextEditingController cardHolderNameController;
  late TextEditingController expiryMonthController;
  late TextEditingController expiryYearController;

  @override
  void initState() {
    super.initState();
    PaymentCard card = PaymentCardManager().paymentCards[widget.cardIndex];
    cardNumberController = TextEditingController(text: card.cardNumber);
    cardHolderNameController = TextEditingController(text: card.cardHolderName);
    expiryMonthController = TextEditingController(text: card.expiryMonth.toString());
    expiryYearController = TextEditingController(text: card.expiryYear.toString());
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderNameController.dispose();
    expiryMonthController.dispose();
    expiryYearController.dispose();
    super.dispose();
  }

  void _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      PaymentCard updatedCard = PaymentCard(
        cardNumber: cardNumberController.text,
        cardHolderName: cardHolderNameController.text,
        expiryMonth: int.parse(expiryMonthController.text),
        expiryYear: int.parse(expiryYearController.text),
      );

      // Save the updated card for the correct user
      await PaymentCardManager().updatePaymentCard(widget.cardIndex, updatedCard, widget.userId);

      Navigator.pop(context, true); // Pop and return true to indicate the changes were saved
    }
  }

  String? _validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter card number';
    }

    String digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length != 16) {
      return 'Card number must be 16 digits';
    }
    return null;
  }

  String? _validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name on card';
    }
    return null;
  }

  String? _validateExpiryMonth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter expiry month';
    }
    int? month = int.tryParse(value);
    if (month == null || month < 1 || month > 12) {
      return 'Invalid month';
    }
    return null;
  }

  String? _validateExpiryYear(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter expiry year';
    }
    int? year = int.tryParse(value);
    int currentYear = DateTime.now().year; 
   if (year == null || value.length != 4) {
    return 'Please enter a valid four-digit year';
  }
  if (year < currentYear || year > currentYear + 10) {
    return 'Invalid year';
  }
  return null;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit payment"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Divider(),
                  SizedBox(height: 40),
                  UserInfoTextFormField(
                    controller: cardNumberController,
                    labelText: "Card number",
                    validator: _validateCardNumber,
                    keyboardType: TextInputType.number,
                    inputFormatters: [CardNumberInputFormatter()],
                  ),
                  SizedBox(height: 20),
                  UserInfoTextFormField(
                    controller: cardHolderNameController,
                    labelText: "Name on card",
                    validator: _validateCardHolderName,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: UserInfoTextFormField(
                          controller: expiryMonthController,
                          labelText: "Expiry month",
                          validator: _validateExpiryMonth,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: UserInfoTextFormField(
                          controller: expiryYearController,
                          labelText: "Expiry year",
                          validator: _validateExpiryYear,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  Center(
                    child: MaterialButton(
                      onPressed: _saveChanges,
                      color: Color.fromRGBO(118, 192, 67, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                      child: Text(
                        'Save changes',
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
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
