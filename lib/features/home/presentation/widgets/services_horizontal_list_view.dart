import 'package:flutter/material.dart';
import 'package:waie/features/home/presentation/widgets/donate_screen.dart';
import 'package:waie/features/home/presentation/widgets/repair_screen.dart';
import 'package:waie/features/home/presentation/widgets/sell_screen.dart';

class ServicesHorizontalListView extends StatelessWidget {
  final List<String> services;
  final List<String> servicesImgs;

  const ServicesHorizontalListView({
    Key? key,
    required this.services,
    required this.servicesImgs,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: ListView.builder(
        itemCount: services.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(
                right: index == 0 ? 0 : 10), // spacing between items
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellScreen()),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RepairScreen()),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DonateScreen()),
                            );
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            servicesImgs[index],
                            width: 180,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    services[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
