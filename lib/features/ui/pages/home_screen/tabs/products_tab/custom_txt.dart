
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTxt extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  CustomTxt({required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textStyle ?? AppStyles.regular14Primary,
    );
  }
}
