import 'package:flutter/material.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/core/config/theme/app_colors.dart';
import 'package:payuung_pribadi_app/presentation/home/widget/appbars.dart';
import 'package:payuung_pribadi_app/presentation/home/widget/categories.dart';
import 'package:payuung_pribadi_app/presentation/home/widget/product.dart';
import 'package:payuung_pribadi_app/presentation/home/widget/wellness.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme().primaryColor,
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              Product(),
              Categories(),
              Wellness(),
            ],
          ),
        ),
      ),
    );
  }
}
