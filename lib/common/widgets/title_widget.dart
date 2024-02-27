import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/pallete.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final double paddingLeft;

  const TitleWidget({
    super.key,
    required this.title,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingBottom = 20,
    this.paddingLeft = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        right: paddingRight,
        bottom: paddingBottom,
        left: paddingLeft,
      ),
      child: Align(alignment: Alignment.bottomLeft, child: Text(title, style: const TextStyle(fontSize: 20, color: Pallete.whiteColor),)),
    );
  }
}
