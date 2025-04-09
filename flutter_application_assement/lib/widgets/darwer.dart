import 'package:flutter/material.dart';
import 'package:flutter_application_assement/properties/assets.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ['Scheduler', Icons.calendar_today],
      ['Timesheet', Icons.access_time],
      ['Discussions', Icons.chat_bubble_outline],
      ['Reports', Icons.insert_chart_outlined],
      ['Feedback', Icons.feedback_outlined],
      ['Certificates', Icons.card_membership],
      ['Feed', Icons.rss_feed],
      ['Analytics', Icons.analytics],
    ];

    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xFFD9D9D9),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        children: [
          const Text(
            "Admin",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D5BBF),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor:const Color(0xFF1D5BBF),
                  child: ClipOval(
                    child: Image.asset(
                      AppAssets.profile,
                      fit: BoxFit.cover,
                      width: 72,
                      height: 72,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'John Doe',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                  ),
                ),
                const Text(
                  'Mentor',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 32, thickness: 0.8, color:Color(0xFFD9D9D9)),
          const SizedBox(height: 8),
          ...items.map(
            (item) => ListTile(
              leading: Icon(item[1] as IconData, color: Colors.black),
              title: Text(
                item[0] as String,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
