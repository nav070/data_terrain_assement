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
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        children: [
          const Text(
            "Admin",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D5BBF)),
          ),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xFF1D5BBF),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    margin: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width > 600 ? 18 : 0,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        AppAssets.profile,
                        fit: BoxFit.cover,
                        width: 72, // diameter - adjust based on padding
                        height: 72,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('Mentor', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Divider(height: 5, endIndent: 0, color: Colors.black),
          const SizedBox(height: 24),
          ...items.map(
            (item) => ListTile(
              leading: Icon(item[1] as IconData),
              title: Text(item[0] as String),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
