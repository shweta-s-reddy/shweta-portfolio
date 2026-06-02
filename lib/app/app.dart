import 'package:flutter/material.dart';
import 'package:shweta_portfolio/core/theme/app_theme.dart';
import 'package:shweta_portfolio/features/home/presentation/pages/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: MyHomePage(
        title: 'Shweta.Dev',
        themeMode: _themeMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}
