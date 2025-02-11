import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/OnBoarding/welcome_screen.dart';
import 'package:waie/features/account/presentation/my_order_screen.dart';
import 'package:waie/features/account/presentation/myaccount.dart';
import 'package:waie/features/account/presentation/payment_screen.dart';
import 'package:waie/features/account/presentation/saved_address_screen.dart';
import 'package:waie/features/account/presentation/track_order_screen.dart';
import 'package:waie/features/account/presentation/widgets/account_header_widget.dart';
import 'package:waie/features/account/presentation/widgets/account_option_list_tile.dart';
import 'package:waie/features/account/presentation/widgets/logout_button_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AccountHeaderWidget(
              accountName: 'Account name',
              phoneNumber: '0530102767',
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
            const SizedBox(height: 8),
            AccountOptionListTile(
              icon: Icons.person,
              title: 'My Account',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyaccountScreen(),
                    ),
                  );
              },
            ),
            AccountOptionListTile(
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

            AccountOptionListTile(
              icon: Icons.payment,
              title: 'Payment',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ),
                  );
              },
            ),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              'Orders',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            AccountOptionListTile(
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
            AccountOptionListTile(
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
            AccountOptionListTile(
              icon: Icons.reply,
              title: 'Return',
              onTap: () {},
            ),
            const SizedBox(height: 190),
            LogoutButtonWidget(
              buttonText: 'Logout',
              buttonColor: const Color.fromRGBO(118, 192, 67, 1),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
