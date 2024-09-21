import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '[App Name] ~> ${FlutterConfig.get('APP_NAME')}',
        ),
        Text(
          '[Bundle ID] ~> ${FlutterConfig.get('APP_ID')}${FlutterConfig.get('APP_SUFFIX_ID')}',
        ),
      ],
    );
  }
}
