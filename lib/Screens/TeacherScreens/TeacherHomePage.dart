import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reader/Screens/TeacherScreens/Mark_Attendance.dart';
import 'package:reader/Widgets/CustomCard.dart';
import 'package:reader/Widgets/Logout_BOX.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:reader/Widgets/Select_Class.dart';
import 'package:reader/Workflow/Base_URLs.dart';
import 'package:reader/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Give_Marks.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key, required this.Teacher_HomePage});
  final List<dynamic> Teacher_HomePage;

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Log_out(
              onTap: () async {
                await logout(context);
              },
            );
          },
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.tealAccent.shade700,
          title: Text("Welcome , ${widget.Teacher_HomePage[0]}"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Teacher_card(context),
                const SizedBox(
                  height: 24,
                ),
                CustomCardViewone(
                  title: "Mark Attendance ",
                  icon: Icons.app_registration,
                  onTap: () async {
                    Fluttertoast.showToast(
                      msg: "Loading Students...",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    final student_records = await http.get(
                      Uri.parse(
                          "$Teacher_Base_url/get_class_records/${widget.Teacher_HomePage[3]}/${widget.Teacher_HomePage[4]}"),
                    );
                    if (student_records.statusCode == 200) {
                      List<dynamic> students =
                          json.decode(student_records.body);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mark_attendance(
                            Students: students,
                            Standard: widget.Teacher_HomePage[3],
                            Section: widget.Teacher_HomePage[4],
                          ),
                        ),
                      );
                    }
                  },
                ),
                CustomCardViewone(
                  title: "Give HomeWork",
                  icon: Icons.home_work_outlined,
                  onTap: () async {
                    Map<String, String> selectedValues =
                        await Select_Class(context);
                    String selectedClass = selectedValues["class"] ?? "1";
                    String selectedSection = selectedValues["section"] ?? "A";
                    print(
                        "Selected Class: $selectedClass, Selected Section: $selectedSection");
                  },
                ),
                CustomCardViewone(
                  title: "Give Marks",
                  icon: Icons.note_add_outlined,
                  onTap: () async {
                    Map<String, String> selectedValues =
                        await Select_Class(context);

                    if (selectedValues["_cancel"] == "false") {
                      String section = selectedValues["section"] ?? "A";
                      int? standard =
                          int.tryParse(selectedValues["class"] ?? "1");
                      Fluttertoast.showToast(
                        msg: "Loading Students...",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      final student_records = await http.get(
                        Uri.parse(
                            "$Teacher_Base_url/get_class_records/$standard}/${section}"),
                      );
                      print(student_records.statusCode);
                      if (student_records.statusCode == 200) {
                        List<dynamic> students =
                            json.decode(student_records.body);
                        print("Navigating");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Give_Marks(
                              Students: students,
                              Standard: widget.Teacher_HomePage[3],
                              Section: widget.Teacher_HomePage[4],
                              Subject: widget.Teacher_HomePage[5],
                            ),
                          ),
                        );
                      }
                    }
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
                    Map<String, String> selectedValues =
                        await Select_Class(context);
                    String selectedClass = selectedValues["class"] ?? "1";
                    String selectedSection = selectedValues["section"] ?? "A";
                    print(
                        "Selected Class: $selectedClass, Selected Section: $selectedSection");
                  },
                ),
                CustomCardViewone(
                  title: "View Marks ",
                  icon: Icons.app_registration,
                  onTap: () async {
                    Map<String, String> selectedValues =
                        await Select_Class(context);
                    String selectedClass = selectedValues["class"] ?? "1";
                    String selectedSection = selectedValues["section"] ?? "A";
                    print(
                        "Selected Class: $selectedClass, Selected Section: $selectedSection");
                  },
                ),
                CustomCardViewone(
                    title: "See Schedule",
                    icon: Icons.library_books,
                    onTap: () {}),
                CustomCardViewone(
                    title: "Notices", icon: Icons.library_books, onTap: () {}),
                CustomCardViewone(
                  title: "Log Out",
                  icon: Icons.logout,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Log_out(
                          onTap: () async {
                            await logout(context);
                          },
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack Teacher_card(BuildContext context) {
    return Stack(
      children: [
        const Over_Images(),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.Teacher_HomePage[0]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      const Text(
                        "Teacher",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Primary Class"),
                                Text(
                                    ": ${widget.Teacher_HomePage[3]} ${widget.Teacher_HomePage[4]}"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Subject"),
                                Text(": ${widget.Teacher_HomePage[5]}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.36,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.32,
            child: Image.network(
              "$Teacher_Base_url/Teacher_image/${widget.Teacher_HomePage[1]}",
              width: double.maxFinite,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("is_teacher_login", false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Home_Screen()));
}
