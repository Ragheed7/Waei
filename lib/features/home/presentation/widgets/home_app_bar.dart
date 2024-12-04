import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/core/theming/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          height: 70,
          width: 100,
          child: Image.asset("assets/images/waie2.png"),
        ),
        Spacer(),
        //  Container(
        //   height: 50,
        //   width: MediaQuery.of(context).size.width / 9,
        //   decoration: BoxDecoration(
        //     color: Colors.black12.withOpacity(0.05),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Center(
        //     child: Icon(
        //       Icons.favorite_border,
        //       color: ColorsManager.mainGreen,
        //     ),
        //   ),
        // ),
        // horizontalSpace(8),

        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 8,
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              Icons.notifications_none,
              color: ColorsManager.mainGreen,
            ),
          ),
        ),
      ],
    );
  }
}
