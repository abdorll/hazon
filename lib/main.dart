import 'package:bot_toast/bot_toast.dart';
import 'package:hazon/routes/app_routes.dart';
import 'package:hazon/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hazon/views/login_screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hazon",
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffafafa),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return botToastBuilder(context, child);
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: LoginScreen.loginScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
