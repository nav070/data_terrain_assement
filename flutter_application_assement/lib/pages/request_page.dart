import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event, size: 48, color: Colors.grey),
              SizedBox(height: 12),
              Text(
                "Request Coming soon",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        );
  }
}