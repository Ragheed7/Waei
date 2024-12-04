import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/routing/app_router.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Waie extends StatelessWidget {
  const Waie({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 833),
      child: MaterialApp(
        title: "Waie App",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(
          primaryColor: ColorsManager.mainGreen,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: isLoggedInUser ? Routes.navigationMenu : Routes.loginScreen,
        // initialRoute: Routes.loginScreen
      ),
    );
  }
}
