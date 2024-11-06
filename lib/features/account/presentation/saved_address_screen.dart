import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/add_new_address_screen.dart';
import 'package:waie/features/account/presentation/edit_address_screen.dart';
import 'package:waie/features/account/presentation/widgets/add_new_address_button_screen.dart';
import 'package:waie/features/account/presentation/widgets/addreess_card_screen.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';



class SavedAddressScreen extends StatelessWidget {
const SavedAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: "Saved Address"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Saved Address",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                AddreessCardScreen(
                  country: "Saudi Arabia",
                  state: "Qassim",
                  city: "Buraidah",
                  street: "3, Saleh Street",
                  postalCode: "97545",
                ),
                SizedBox(height: 100),
                AddNewAddressButtonScreen(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
