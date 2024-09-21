import 'package:calculator_camera/app/bloc/arithmetic/arithmetic_cubit.dart';
import 'package:calculator_camera/app/bloc/theme/theme_cubit.dart';
import 'package:calculator_camera/app/common/app_colors.dart';
import 'package:calculator_camera/app/extentions/media_query_ext.dart';
import 'package:calculator_camera/app/page/widgets/home_bottom_sheet.dart';
import 'package:calculator_camera/app/page/widgets/home_header.dart';
import 'package:calculator_camera/app/page/widgets/home_list_item.dart';
import 'package:calculator_camera/app/widgets/buttons.dart';
import 'package:calculator_camera/app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ThemeCubit>().toggleTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryLightGrey,
      appBar: AppBar(
        title: Text(
          '${FlutterConfig.get('APP_NAME')}',
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: context.sizeHorizontal(),
            height: context.sizeVertical(),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Spacing.vertical(16),
                  HomeHeader(),
                  Spacing.vertical(16),
                  HomeArithmeticList(),
                  Spacing.vertical(context.sizeVertical() * .175),
                ],
              ),
            ),
          ),
          HomeBottomSheet(),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: context.sizeVertical() * .15),
        child: AppButton.common(
          context: context,
          icon: Icons.camera,
          callback: () {
            context.read<ArithmeticCubit>().captureArithmeticFrom(context);
          },
        ),
      ),
    );
  }
}
