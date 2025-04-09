import 'package:flutter/material.dart';
import 'package:flutter_application_assement/pages/home_screen.dart';
import 'package:flutter_application_assement/providers/screen_state_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const MyApp(),
    ),
  );
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
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
