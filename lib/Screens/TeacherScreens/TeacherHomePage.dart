import 'package:flutter/material.dart';
import 'package:reader/Widgets/CustomCard.dart';
import 'package:reader/Widgets/Teacher_card.dart';

import '../../Widgets/Select_Class.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  String url = "https://picsum.photos/200";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome , AABBCC"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Teacher_Card(url: url, name: 'Alka Verma', standard: '8th', subject: 'Math',),
              CustomCardViewone(
                title: "Mark Attendance ",
                icon: Icons.app_registration,
                onTap: () {},
              ),
              CustomCardViewone(
                title: "Give HomeWork",
                icon: Icons.home_work_outlined,
                onTap: () async {
                  Map<String, String> selectedValues = await Select_Class(context);
                  String selectedClass = selectedValues["class"] ?? "1";
                  String selectedSection = selectedValues["section"] ?? "A";
                  print("Selected Class: $selectedClass, Selected Section: $selectedSection");
                },
              ),
              CustomCardViewone(
                title: "Give Marks",
                icon: Icons.note_add_outlined,
                onTap: () async {
                  Map<String, String> selectedValues = await Select_Class(context);
                  String selectedClass = selectedValues["class"] ?? "1";
                  String selectedSection = selectedValues["section"] ?? "A";
                  print("Selected Class: $selectedClass, Selected Section: $selectedSection");
                },
              ),
              CustomCardViewone(
                title: "See Attendance Records",
                icon: Icons.view_comfy_outlined,
                onTap: () {},
              ),
              CustomCardViewone(
                title: "View Homework ",
                icon: Icons.app_registration,
                onTap: () async {
                  Map<String, String> selectedValues = await Select_Class(context);
                  String selectedClass = selectedValues["class"] ?? "1";
                  String selectedSection = selectedValues["section"] ?? "A";
                  print("Selected Class: $selectedClass, Selected Section: $selectedSection");
                },
              ),
              CustomCardViewone(
                title: "View Marks ",
                icon: Icons.app_registration,
                onTap: () async {
                  Map<String, String> selectedValues = await Select_Class(context);
                  String selectedClass = selectedValues["class"] ?? "1";
                  String selectedSection = selectedValues["section"] ?? "A";
                  print("Selected Class: $selectedClass, Selected Section: $selectedSection");
                },
              ),
              CustomCardViewone(
                title: "See Schedule",
                icon: Icons.library_books,
                onTap: () {}
              ),
              CustomCardViewone(
                title: "Notices",
                icon: Icons.library_books,
                onTap: () {}
              ),
              CustomCardViewone(
                title: "Log Out",
                icon: Icons.logout_outlined,
                onTap: () {}
              )
            ],
          ),
        ),
      ),
    );
  }
}

