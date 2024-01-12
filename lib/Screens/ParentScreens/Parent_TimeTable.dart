import 'package:flutter/material.dart';

class Parent_TimeTable extends StatefulWidget {
  const Parent_TimeTable({super.key, required this.TimeTable_List});
  final List<dynamic> TimeTable_List;

  @override
  State<Parent_TimeTable> createState() => _Parent_TimeTableState();
}

class _Parent_TimeTableState extends State<Parent_TimeTable> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
