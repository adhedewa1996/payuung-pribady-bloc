import 'dart:io';

import 'package:flutter/cupertino.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  final String? imagePath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (imagePath == null) {
      return const SizedBox();
    }
    return Image.file(
      File(imagePath ?? ''),
      width: width ?? 100,
      height: height ?? 100,
      fit: BoxFit.fitWidth,
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return const SizedBox();
      },
    );
  }
}
