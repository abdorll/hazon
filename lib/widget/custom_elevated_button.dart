import 'package:flutter/material.dart';
import 'package:hazon/theme/app_colors.dart';
import 'package:hazon/utils/color.dart';
import 'package:hazon/widget/texts.dart';

@immutable
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      this.borderColor,
      this.textColor,
      this.radius,
      this.size,
      this.backgroundColor,
      this.elevation,
      required this.text,
      required this.onTap});

  final String text;
  final VoidCallback onTap;
  final double? radius, elevation;
  final Color? borderColor, textColor, backgroundColor;
  final Size? size;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            side:
                BorderSide(color: borderColor ?? Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(
              radius ?? 10,
            ),
          ),
        ).copyWith(
            backgroundColor: MaterialStatePropertyAll<Color>(
                backgroundColor ?? AppColors.primaryColor),
            fixedSize: MaterialStateProperty.all<Size>(
                size ?? const Size(double.maxFinite, 45))),
        onPressed: () {
          onTap();
        },
        child: TextOf(text, 15, textColor ?? AppColors.white, FontWeight.w500));
  }
}
