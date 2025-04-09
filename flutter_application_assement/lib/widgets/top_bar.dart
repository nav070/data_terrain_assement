import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_assement/properties/assets.dart';
import 'package:flutter_svg/svg.dart';

class DashboardTopBar extends StatelessWidget {
  const DashboardTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
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
        _buildIcon(CupertinoIcons.bell_fill, showNotification: true),
        _buildDarwer(context)
      ],
    );
  }

  static Widget _buildIcon(IconData icon, {bool showNotification = false}) {
    return Container(
      height: 24,
      width: 24,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF5FF),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Badge(
        backgroundColor:
            showNotification ? const Color(0xFFFD003A) : Colors.transparent,
        child: Icon(
          icon,
          color: const Color(0xFF00AEBD),
          size: 18,
        ),
      ),
    );
  }

  static Widget _buildDarwer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openEndDrawer();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        height: 24,
        width: 24,
        child: SvgPicture.asset(AppAssets.menu)
,
      ),
    );
  }
}
