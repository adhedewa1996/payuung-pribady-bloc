import 'package:flutter/material.dart';

class HeaderMinimal extends StatelessWidget {
  const HeaderMinimal({
    super.key,
    required this.title,
    required this.titleStyle,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.marginRight = 0.0,
    this.marginLeft = 0.0,
    this.callback,
  });

  final double marginTop;
  final double marginBottom;
  final double marginRight;
  final double marginLeft;
  final String title;
  final TextStyle titleStyle;
  final Function()? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback!.call();
        }
      },
      child: Container(
        margin: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          right: marginRight,
          left: marginLeft,
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
