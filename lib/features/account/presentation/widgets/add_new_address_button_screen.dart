import 'package:flutter/material.dart';
import 'package:waie/features/account/presentation/add_new_address_screen.dart';

class AddNewAddressButtonScreen extends StatelessWidget {
  const AddNewAddressButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewAddressScreen(),
            ),
          );
        },
        color: Color.fromRGBO(118, 192, 67, 1),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: 16,
        ),
        child: Text(
          '+ Add new address',
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
    );
  }
}
