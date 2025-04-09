import 'package:flutter/material.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event, size: 48, color: Colors.grey),
              SizedBox(height: 12),
              Text(
                "Programs Coming Soon",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        );
  }
}