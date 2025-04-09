import 'package:flutter/material.dart';
import 'package:flutter_application_assement/pages/dashBoard_screen.dart';
import 'package:flutter_application_assement/pages/program_page.dart';
import 'package:flutter_application_assement/pages/request_page.dart';
import 'package:flutter_application_assement/pages/user_page.dart';
import 'package:flutter_application_assement/providers/screen_state_provider.dart';
import 'package:flutter_application_assement/widgets/bottem_bar.dart';
import 'package:flutter_application_assement/widgets/darwer.dart';
import 'package:flutter_application_assement/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = const [
    DashboardScreen(),
    ProgramScreen(),
    RequestScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavigationProvider>().currentIndex;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: const AppDrawer(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: DashboardTopBar(),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
