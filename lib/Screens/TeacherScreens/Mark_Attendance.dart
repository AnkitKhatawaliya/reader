import 'package:flutter/material.dart';

class Mark_attendance extends StatefulWidget {
  const Mark_attendance(
      {super.key,
      required this.Student_List,
      required this.Standard,
      required this.Section});
  final List<dynamic> Student_List;
  final String Standard;
  final String Section;

  @override
  State<Mark_attendance> createState() => _Mark_attendanceState();
}

class _Mark_attendanceState extends State<Mark_attendance> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
