import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event, size: 48, color: Colors.grey),
              SizedBox(height: 12),
              Text(
                "User Coming soon",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        );
  }
  }
