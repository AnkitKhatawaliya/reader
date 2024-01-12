import 'package:flutter/material.dart';

class parentSeeAtt extends StatefulWidget {
  const parentSeeAtt({super.key, required this.Attendance});
  final List<dynamic> Attendance;

  @override
  State<parentSeeAtt> createState() => _parentSeeAttState();
}

class _parentSeeAttState extends State<parentSeeAtt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          title: const Text("Attendance Records"),
        ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
