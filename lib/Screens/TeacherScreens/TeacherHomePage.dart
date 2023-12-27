import 'package:flutter/material.dart';
import 'package:reader/Widgets/CustomCard.dart';
import 'package:reader/Widgets/Teacher_card.dart';

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
        title: Text("Welcome , AABBCC"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              Teacher_Card(url: url, name: 'Alka Verma', standard: '8th', subject: 'Math',),
              CustomCardViewone(
                title: "Mark Attendance ",
                icon: Icons.app_registration,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Give HomeWork",
                icon: Icons.home_work_outlined,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Give Marks",
                icon: Icons.note_add_outlined,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "See Attendance Records",
                icon: Icons.view_comfy_outlined,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "See Time Table",
                icon: Icons.library_books,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Notifications",
                icon: Icons.library_books,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Log Out",
                icon: Icons.logout_outlined,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

