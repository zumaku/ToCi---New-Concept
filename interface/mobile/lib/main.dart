import 'package:flutter/material.dart';
import 'package:toci_mobile/pages/home_page.dart';
import 'package:toci_mobile/pages/introductions_screen.dart';
import 'package:provider/provider.dart';
import 'package:toci_mobile/services/user_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => NameProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NameProvider>(
      builder: (context, nameProvider, child) {
        return MaterialApp(
          title: "ToCi Mobile",
          theme: ThemeData(
            primaryColor: Color(0xFF1B8345),
            appBarTheme: AppBarTheme(
              color: Colors.transparent,
            ),
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
            buttonTheme: ButtonThemeData(
              buttonColor: Color(0xFF1B8345),
            ),
          ),
          home: nameProvider.name != ''
              ? Homepage()
              : IntroductionsScreen(),
        );
      },
    );
  }
}
