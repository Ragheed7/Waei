import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/features/home/logic/cubit/home_cubit.dart';
import 'package:waie/features/home/presentation/widgets/categories_bloc_builder.dart';
import 'package:waie/features/home/presentation/widgets/home_app_bar.dart';
import 'package:waie/features/home/presentation/widgets/home_banner.dart';
import 'package:waie/features/home/presentation/widgets/left_section_title.dart';
import 'package:waie/features/home/presentation/widgets/services_horizontal_list_view.dart';

class HomeScreen extends StatelessWidget {
  List<String> servicesImgs = [
    "assets/images/Sell.jpg",
    "assets/images/Repair.jpg",
    "assets/images/Donate.jpg",
  ];

  List<String> services = [
    "Sell",
    "Repair",
    "Donate",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getCategories(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeAppBar(),
                  verticalSpace(20),
                  HomeBanner(),
                  verticalSpace(24),
                  LeftSectionTitle(text: "Request a Service"),
                  verticalSpace(20),
                  ServicesHorizontalListView(
                    services: services,
                    servicesImgs: servicesImgs,
                  ),
                  verticalSpace(24),
                  LeftSectionTitle(text: "Top Categories"),
                  verticalSpace(20),
                  CategoriesBlocBuilder(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
