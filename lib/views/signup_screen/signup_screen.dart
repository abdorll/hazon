import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:hazon/theme/app_colors.dart';
import 'package:hazon/widget/custom_elevated_button.dart';
import 'package:hazon/widget/iconss.dart';
import 'package:hazon/widget/input_field.dart';
import 'package:hazon/widget/spacing.dart';
import 'package:hazon/widget/texts.dart';
import 'package:intl/intl.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String signupScreen = "signupScreen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  DateTime selectedDate = DateTime.now();
  String? selectedValue;
  TextEditingController? dateFieldController;
  @override
  void initState() {
    setState(() {
      dateFieldController = TextEditingController();
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Gender';
  List<String> dropDownMenuItem = ["Male", "Female"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: IconOf(Icons.arrow_back_rounded, 30, AppColors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        title: TextOf("Sign Up", 23, AppColors.white, FontWeight.w500),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextOf(
                        "Please enter your personal informationn to create your own secure account",
                        15,
                        AppColors.black.withOpacity(0.7),
                        FontWeight.w400,
                        align: TextAlign.left,
                      ))
                    ],
                  ),
                  const YMargin(10),
                  Row(
                    children: [
                      TextOf(
                        "Fields marked (*) are required",
                        13,
                        AppColors.black,
                        FontWeight.w600,
                        align: TextAlign.left,
                      ),
                    ],
                  ),
                  const YMargin(30),
                  Inputfield(
                      title: "First Name*",
                      fieldName: "Enter your First name",
                      onChanged: (e) {}),
                  const YMargin(20),
                  Inputfield(
                      title: "Last Name*",
                      fieldName: "Enter your Last Name",
                      onChanged: (e) {}),
                  const YMargin(20),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Inputfield(
                            title: "Date of Birth*",
                            onTap: () {
                              _selectDate(context);
                            },
                            fieldName: "Date of Birth",
                            textEditingController: dateFieldController,
                            inputType: TextInputType.none,
                            onChanged: (e) {}),
                      ),
                      XMargin(10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextOf("Gendder*", 14, AppColors.black,
                                    FontWeight.w500),
                                const YMargin(5),
                              ],
                            ),
                            Container(
                              height: 47.5,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.grey.withOpacity(0.6)),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 16,
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        iconSize: 0,
                                        hint: TextOf("Gender", 15,
                                            AppColors.grey, FontWeight.w500),
                                        style: GoogleFonts.poppins(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                        icon: const Icon(
                                            Icons.expand_more_outlined),
                                        padding: const EdgeInsets.all(0),
                                        underline: const SizedBox.shrink(),
                                        value: selectedValue,
                                        items: dropDownMenuItem
                                            .map((String e) => DropdownMenuItem(
                                                value: e, child: Text(e)))
                                            .toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue = value!;
                                          });
                                        }),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: IconOf(Icons.expand_more_rounded,
                                          20, AppColors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const YMargin(20),
                  Inputfield(
                      inputType: TextInputType.emailAddress,
                      title: "Email*",
                      fieldName: "Enter a valid email",
                      onChanged: (e) {}),
                  YMargin(20),
                  Inputfield(
                    fieldName: 'Password',
                    title: "Password",
                    showVisibility: true,
                    onChanged: (e) {},
                    isPassword: true,
                  ),
                  YMargin(MediaQuery.of(context).size.height * 0.1),
                  CustomElevatedButton(text: "Submit", onTap: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1923, 8),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateFieldController!.text =
            DateFormat.yMMMMd().format(selectedDate).toString();
      });
    }
  }
}
