import 'package:flutter/material.dart';

class Parent_Notices extends StatefulWidget {
  const Parent_Notices({super.key, required this.Notice_List});
  final List<dynamic> Notice_List;


  @override
  State<Parent_Notices> createState() => _Parent_NoticesState();
}

class _Parent_NoticesState extends State<Parent_Notices> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
