import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/navigation_menu.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late Timer _timer;
  int _start = 180; // 180 seconds for 3 minutes
  bool _isResendAllowed = false;

  void startTimer() {
    _isResendAllowed = false; // Disable resend when timer starts
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          _isResendAllowed = true; // Enable resend when timer ends
        } else {
          _start--;
        }
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _resendOTP() {

    // Restart the timer
    _timer.cancel();
    _start = 180;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 106,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Verify Your Account',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'cabin',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 37),
                    child: Text(
                      'Enter the OTP verfication code we sent to your phone ${widget.phoneNumber}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorsManager.mainGrey,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'cabin',
                      ),
                    ),
                  ),
                  // SizedBox(height: 64),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   child: Text(
                  //     "$minutesStr:$secondsStr",
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //       color: MainGreen,
                  //       fontFamily: 'cabin',
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 24),
                  OtpTextField(
                    numberOfFields: 5,
                    fieldWidth: 50,
                    fieldHeight: 50,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    enabledBorderColor: ColorsManager.mainGreen,
                    focusedBorderColor: ColorsManager.mainBrown,
                    cursorColor: ColorsManager.mainGreen,
                    borderWidth: BorderSide.strokeAlignOutside,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                    },
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the OTP? ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: 'cabin',
                        ),
                      ),
                      GestureDetector(
                        onTap: _isResendAllowed ? _resendOTP : null,
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            color: _isResendAllowed
                                ? ColorsManager.mainGreen
                                : ColorsManager.secondaryGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cabin',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 56),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    color: ColorsManager.mainGreen,
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 9),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: ColorsManager.mainBlack,
                        fontFamily: 'cabin',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    minWidth: 200,
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
          // The back button positioned absolutely
          Positioned(
            top: 64,
            left: 16,
            child: Container(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: ColorsManager.mainBlack,
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
