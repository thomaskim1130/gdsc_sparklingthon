import 'package:flutter/material.dart';
import 'package:gdsc_sparklingthon/pages/login_page.dart';
import 'package:gdsc_sparklingthon/pages/main_page.dart';
import 'package:gdsc_sparklingthon/providers/voted_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => VotedProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _setThemeData(),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }

  // 앱의 전반적인 테마 설정
  ThemeData _setThemeData() {
    return ThemeData(
      appBarTheme:
          const AppBarTheme(elevation: 0, backgroundColor: Colors.white),
      //fontFamily: 'Pretendard',
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'NanumBarunGothic',
      splashColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.transparent,
      ),
    );
  }
}
