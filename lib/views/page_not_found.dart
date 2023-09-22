import 'package:flutter/material.dart';
import 'package:hazon/theme/app_colors.dart';
import 'package:hazon/widget/texts.dart';

class PageNotFound extends StatelessWidget {
  static const String pageNotFound = "pageNotFound";
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
                TextOf("Page not found!", 20, AppColors.red, FontWeight.w400),
          )
        ],
      ),
    );
  }
}
