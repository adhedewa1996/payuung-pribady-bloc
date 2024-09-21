import 'package:calculator_camera/app/common/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '[App Name]',
              ),
              Text(
                '${FlutterConfig.get('APP_NAME')}',
              ),
            ],
          ),
        ),
        Spacing.vertical(16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '[Bundle ID]',
              ),
              Text(
                '${FlutterConfig.get('APP_ID')}${FlutterConfig.get('APP_SUFFIX_ID')}',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
