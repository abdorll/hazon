import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazon/theme/app_colors.dart';
import 'package:hazon/utils/color.dart';
import 'package:hazon/utils/images.dart';
import 'package:hazon/views/signup_screen/signup_screen.dart';
import 'package:hazon/widget/custom_elevated_button.dart';
import 'package:hazon/widget/iconss.dart';
import 'package:hazon/widget/input_field.dart';
import 'package:hazon/widget/spacing.dart';
import 'package:hazon/widget/texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String loginScreen = "loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget suffix = const SizedBox.shrink();
  String? password;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppColors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageOf.logo,
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom * 0.1),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: AppColors.primaryColor.withOpacity(0.4)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextOf("Welcome back! August Jared Mark", 17,
                                    AppColors.black, FontWeight.w500)
                              ],
                            ),
                            YMargin(MediaQuery.of(context).size.height * 0.02),
                            Inputfield(
                              fieldName: 'Password',
                              showVisibility: true,
                              onChanged: (e) {
                                password = e!;
                              },
                              isPassword: true,
                            ),
                            YMargin(MediaQuery.of(context).size.height * 0.02),
                            CustomElevatedButton(text: "LOG IN", onTap: () {}),
                            const YMargin(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: TextOf(
                                      "Switch account",
                                      13,
                                      decoration: TextDecoration.underline,
                                      AppColors.primaryColor,
                                      FontWeight.w400),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: TextOf("Forgot password?", 13,
                                      AppColors.primaryColor, FontWeight.w500),
                                ),
                              ],
                            ),
                            const YMargin(50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextOf("Don't have an account?", 14,
                                    AppColors.black, FontWeight.w500),
                                const XMargin(5),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SignupScreen.signupScreen);
                                  },
                                  child: TextOf("Signup", 13,
                                      AppColors.primaryColor, FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}







  // Inputfield(
  //                               title: "Email",
  //                               suffixIcon: suffix,
  //                               validator: _loginProvider.emailValidator,
  //                               fieldName: "john@email.com",
  //                               onChanged: (e) {}),
  //                           const YMargin(15),
  //                           Inputfield(
  //                               title: "Password",
  //                               validator: _loginProvider.passwordValidator,
  //                               isPassword: true,
  //                               fieldName: "Password (min. of 8 characters)",
  //                               onChanged: (e) {
  //                                 LoginProvider.password.value = e!.toString();
  //                               }),





  //   if (password.value.isEmpty) {
  //     return "Password is required";
  //   } else if (password.value.length < 8) {
  //     return "Password must contain 8 characters!";
  //   }
  //   return null;
  // };