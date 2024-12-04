import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';
import 'package:waie/features/account/presentation/my_order_screen.dart';
import 'package:waie/features/account/presentation/payment_screen.dart';
import 'package:waie/features/account/presentation/saved_address_screen.dart';
import 'package:waie/features/account/presentation/track_order_screen.dart';
import 'package:waie/features/account/presentation/widgets/account_header_widget.dart';
import 'package:waie/features/account/presentation/widgets/account_option_list_tile_screen.dart';
import 'package:waie/features/account/presentation/widgets/logout_button_widget.dart';
import 'package:waie/features/account/presentation/widgets/my_services.dart';
import 'package:waie/features/login/logic/cubit/user_cubit.dart';
import 'package:waie/features/login/presentation/login_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserData?>(
      builder: (context, userInfo) {
        if (userInfo == null) {
          // Handle the case when the user is not logged in
          return Center(child: Text("User not logged in"));
        }

        String userId = userInfo.userId ?? "";

        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountHeaderWidget(
                  accountName: userInfo.userName ?? 'Account name',
                  phoneNumber: (userInfo.phone ?? "0500000000"),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
                const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                AccountOptionListTileScreen(
                  icon: Icons.person,
                  title: 'My Account',
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.myAccountScreen);
                  },
                ),
                AccountOptionListTileScreen(
                  icon: Icons.location_on,
                  title: 'Saved address',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SavedAddressScreen(),
                      ),
                    );
                  },
                ),
                AccountOptionListTileScreen(
                  icon: Icons.payment,
                  title: 'Payment',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(userId: userId), 
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                const Text(
                  'Orders',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                AccountOptionListTileScreen(
                  icon: Icons.inventory,
                  title: 'My orders',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyOrderScreen(), 
                      ),
                    );
                  },
                ),
                AccountOptionListTileScreen(
                  icon: Icons.handyman,
                  title: 'My services',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyServices(), 
                      ),
                    );
                  },
                ),
                AccountOptionListTileScreen(
                  icon: Icons.local_shipping,
                  title: 'Track order',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrackOrderScreen(), 
                      ),
                    );
                  },
                ),
                AccountOptionListTileScreen(
                  icon: Icons.reply,
                  title: 'Return',
                  onTap: () {},
                ),
                SizedBox(height: 130),
                LogoutButtonWidget(
                  buttonText: 'Logout',
                  buttonColor: const Color.fromRGBO(118, 192, 67, 1),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
