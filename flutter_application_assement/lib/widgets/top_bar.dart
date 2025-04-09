import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_assement/properties/assets.dart';

class DashboardTopBar extends StatelessWidget {
  const DashboardTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor:Color(0xFFFFFFFF),
        title: Container(
          width: 30,
          padding: const EdgeInsets.all(2),
          margin: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width > 600 ? 18 : 0),
          decoration: const BoxDecoration(
            color: Color(0xFF1D5BBF),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            AppAssets.profile,
          ),
        ),
        actions: [
          _buildIcon(Icons.search_rounded),
          _buildIcon(CupertinoIcons.bell_fill),
          _buildDarwer(Icons.menu, context)
        ],
      );
  }

  static Widget _buildIcon(IconData icon) {
    return Container(
        margin: const EdgeInsets.only(right: 16),
      height: 24,
        width: 24,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 20, color: Colors.black87),
    );
  }
    static Widget _buildDarwer(IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: (){
        Scaffold.of(context).openEndDrawer();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
         height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 20, color: Colors.black87),
      ),
    );
  }
}