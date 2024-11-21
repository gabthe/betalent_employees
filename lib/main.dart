import 'package:desafio_be_talent/src/view/employees_view.dart';
import 'package:desafio_be_talent/src/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Helvetica',
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Helvetica',
          ),
          bodySmall: TextStyle(
            fontFamily: 'Helvetica',
          ),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
