import 'package:flutter/material.dart';
import 'package:flutter_application_assement/providers/screen_state_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavigationProvider>().currentIndex;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        context.read<NavigationProvider>().changeIndex(index);
      },
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: "Programs",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: "Requests",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Users",
        ),
      ],
    );
  }
}
