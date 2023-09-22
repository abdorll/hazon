// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hazon/theme/app_colors.dart';
import 'package:hazon/utils/color.dart';
import 'package:hazon/widget/iconss.dart';
import 'package:hazon/widget/spacing.dart';
import 'package:hazon/widget/texts.dart';

class Inputfield extends StatefulWidget {
  Inputfield({
    required this.fieldName,
    required this.onChanged,
    this.isPassword = false,
    this.showVisibility = true,
    this.fillColor,
    this.hintColor,
    this.textColor,
    this.borderColor,
    this.useLabel = false,
    this.validator,
    this.textEditingController,
    this.title,
    this.onTap,
    this.suffixIcon,
    this.cachedText,
    this.borderWidth,
    this.inputType = TextInputType.emailAddress,
    Key? key,
  }) : super(key: key);
  Color? fillColor, hintColor, textColor;
  String? fieldName, title;
  TextInputType inputType;
  bool isPassword, showVisibility, useLabel;
  Color? borderColor;
  VoidCallback? onTap;
  TextEditingController? textEditingController;
  double? borderWidth;
  String? cachedText;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  void Function(String?) onChanged;

  @override
  State<Inputfield> createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? const SizedBox.shrink()
            : Column(
                children: [
                  TextOf(widget.title!, 14, AppColors.black, FontWeight.w500),
                  const YMargin(5),
                ],
              ),
        TextFormField(
          // autofocus: true,
          onChanged: widget.onChanged,
          onTap: () {
            widget.onTap == null ? () {} : widget.onTap!();
          },
          cursorWidth: 1.5,
          validator: widget.validator,
          cursorColor: AppColors.primaryColor,
          keyboardType: widget.inputType,
          controller: widget.textEditingController,
          //keyboardAppearance: ,
          obscureText: widget.isPassword == true ? obscureText : false,
          style: GoogleFonts.mulish(
              color: widget.textColor ?? AppColors.black,
              decoration: TextDecoration.none,
              decorationColor: Colors.transparent),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? AppColors.white,
            contentPadding: const EdgeInsets.all(7),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            hintText: widget.fieldName,
            hintStyle: GoogleFonts.mulish(
                color: widget.hintColor ?? AppColors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 14),
            suffixIcon:
                (widget.isPassword == true && widget.showVisibility == true)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: IconOf(
                                  obscureText == true
                                      ? Icons.visibility
                                      : Icons.visibility_off_rounded,
                                  20,
                                  AppColors.primaryColor)),
                          XMargin(10)
                        ],
                      )
                    : const SizedBox.shrink(),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 70, maxWidth: 65),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    width: widget.borderWidth ?? 1,
                    color: widget.borderColor ?? AppColors.primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    width: widget.borderWidth ?? 1,
                    color:
                        widget.borderColor ?? AppColors.grey.withOpacity(0.6))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    width: widget.borderWidth ?? 1,
                    color: widget.borderColor ?? AppColors.primaryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    width: widget.borderWidth ?? 1,
                    color:
                        widget.borderColor ?? AppColors.grey.withOpacity(0.6))),
          ),
        ),
      ],
    );
  }
}
