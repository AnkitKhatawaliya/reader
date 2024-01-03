import 'package:flutter/material.dart';
import 'package:reader/Widgets/CustomCard.dart';
import 'package:reader/Widgets/Logout_BOX.dart';
import 'package:reader/Widgets/Select_Class.dart';
import 'package:reader/Widgets/Teacher_card.dart';
import 'package:reader/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key, required this.Teacher_HomePage});
  final List<dynamic> Teacher_HomePage;


  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  String url = "https://picsum.photos/200";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Welcome , ${widget.Teacher_HomePage[0]}"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Teacher_Card(url: url, name: '${widget.Teacher_HomePage[0]}', standard: '${widget.Teacher_HomePage[3]} ${widget.Teacher_HomePage[4]}', subject: '${widget.Teacher_HomePage[5]}',),
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
                onTap: () {
                  print(widget.Teacher_HomePage[0]);
                },
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
                icon: Icons.logout,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Log_out(
                        onTap: () async {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setBool("is_teacher_login", false);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home_Screen()));
                        },
                      );
                    },
                  );
                },
              )            ],
          ),
        ),
      ),
    );
  }
}

