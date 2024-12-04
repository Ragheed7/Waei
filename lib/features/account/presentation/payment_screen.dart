import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/local_models/payment_model/payment_card.dart';
import 'package:waie/core/local_models/payment_model/payment_card_manager.dart';
import 'package:waie/features/account/presentation/add_new_payment_screen.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/account/presentation/widgets/payment_card_screen.dart';
import 'package:waie/features/cart/data/model/selected_address_and_payment/selected_payment_card_cubit.dart';

class PaymentScreen extends StatefulWidget {
  final bool isSelection; // Indicates if the screen is for selecting a card
  final String userId; // Select payment cards for a specific user
   
  const PaymentScreen({Key? key, this.isSelection = false, this.userId = ""}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentCard> paymentCards = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPaymentCards();
  }

  Future<void> _loadPaymentCards() async {
    await PaymentCardManager().loadPaymentCards(widget.userId);
    setState(() {
      paymentCards = PaymentCardManager().paymentCards;
      isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      paymentCards = PaymentCardManager().paymentCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBarScreen(title: 'Payment'),
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarScreen(title: 'Payment'),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: paymentCards.isEmpty
                  ? SizedBox(
                      height: 600,
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/warning-2.png",
                                    height: 120,
                                    width: 180,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'No Services found.',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Add New Payment Button
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: MaterialButton(
                                onPressed: () async {
                                  bool? result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddNewPaymentScreen(userId: widget.userId,),
                                    ),
                                  );
                                  if (result == true) {
                                    await _loadPaymentCards();
                                  }
                                },
                                color: Color.fromRGBO(118, 192, 67, 1),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1,
                                  vertical: 16,
                                ),
                                child: Text(
                                  '+ Add new payment',
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
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "My Payment Cards",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15),
                        // Display the list of payment cards
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: paymentCards.length,
                          itemBuilder: (context, index) {
                            final card = paymentCards[index];
                            return GestureDetector(
                              onTap: () {
                                if (widget.isSelection) {
                                  // Update the SelectedPaymentCardCubit with the chosen card
                                  context
                                      .read<SelectedPaymentCardCubit>()
                                      .selectPaymentCard(card);
                                  // Pop back to CheckOutScreen
                                  Navigator.pop(context, card);
                                }
                              },
                              child: Column(
                                children: [
                                  PaymentCardScreen(
                                    paymentCard: card, // Pass the entire card
                                    cardIndex: index,
                                    userId: widget.userId,
                                    onDelete: () {
                                      setState(() {
                                        // Refresh the payment cards list
                                        _loadPaymentCards();
                                      });
                                    },
                                    isSelected: widget.isSelection &&
                                        card ==
                                            (context
                                                        .read<
                                                            SelectedPaymentCardCubit>()
                                                        .state
                                                    is PaymentCardSelected
                                                ? (context
                                                            .read<
                                                                SelectedPaymentCardCubit>()
                                                            .state
                                                        as PaymentCardSelected)
                                                    .selectedCard
                                                : null),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        // Add New Payment Button
                        Center(
                          child: MaterialButton(
                            onPressed: () async {
                              bool? result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddNewPaymentScreen(userId: widget.userId,),
                                ),
                              );
                              if (result == true) {
                                await _loadPaymentCards();
                              }
                            },
                            color: Color.fromRGBO(118, 192, 67, 1),
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1,
                              vertical: 16,
                            ),
                            child: Text(
                              '+ Add new payment',
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
                            minWidth: MediaQuery.of(context).size.width * 0.8,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
            ),
          ),
        ),
      );
    }
  }
}
