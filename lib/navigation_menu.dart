import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/account/presentation/account_screen.dart';
import 'package:waie/features/cart/presentation/cart_screen.dart';
import 'package:waie/features/search/presentation/search_screen.dart';
import 'package:waie/features/home/presentation/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int myCurrentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(), 
    SearchScreen(), 
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myCurrentIndex,
        children: pages,
      ),
      bottomNavigationBar: PhysicalShape(
        color: Colors.white,
        elevation: 4.0,
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 32,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showUnselectedLabels: true,
            selectedItemColor: ColorsManager.mainGreen,
            unselectedItemColor: ColorsManager.navBarGrey,
            backgroundColor: Colors.white,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
