import 'package:example/app/commons/widgets/boxs.dart';
import 'package:example/app/commons/widgets/spacing.dart';
import 'package:example/app/core/style/colors/app_colors.dart';
import 'package:example/app/core/style/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          appBar: AppBar(
            title: const Text('GETX'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              header(context),
              Boxs.withThemeColors(
                context: context,
                text: controller.title,
                description: controller.description,
              ),
              Boxs.withPalletColors(
                colors: AppColors.greenMain,
                text: controller.title,
                description: controller.description,
                context: context,
              ),
              newslist(),
              Spacing.vertical(16),
            ],
          ),
          floatingActionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.buttonTheme.colorScheme!.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 16,
              ),
              shape: CircleBorder(),
            ),
            onPressed: ThemeService().switchTheme,
            child: Icon(
              Icons.theater_comedy,
              color: context.theme.primaryIconTheme.color,
            ),
          ),
        );
      },
    );
  }

  Widget header(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FLAVOR',
                style: context.theme.textTheme.titleLarge,
              ),
              Text(
                '${FlutterConfig.get('APP_NAME')}',
                style: context.theme.textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget newslist() {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.newsList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final news = controller.newsList[index];
          return Boxs.news(news: news, context: context);
        },
      );
    });
  }
}
