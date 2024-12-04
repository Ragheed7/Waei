import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';
import 'package:waie/features/account/presentation/widgets/user_info/logic/update_user_cubit.dart';
import 'package:waie/features/account/presentation/widgets/user_info/presentation/widgets/update_user_form.dart';
import 'package:waie/features/login/logic/cubit/user_cubit.dart';

class MyaccountScreen extends StatelessWidget {
  const MyaccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserData?>(
      builder: (context, userInfo) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("My Account"),
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
                    SizedBox(height: 10),
                    Text(
                      "Personal Details",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                          // Display user name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                userInfo?.userName ?? "Username",
                                style: TextStyle(fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateUserForm(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(118, 192, 67, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          // Display email
                          Text(
                            userInfo?.email ?? "email@example.com",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 6),
                          // Display phone number
                          Text(
                            (userInfo?.phone ?? "0500000000"),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
