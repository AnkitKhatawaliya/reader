import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reader/Screens/TeacherScreens/Give_Homework.dart';
import 'package:reader/Screens/TeacherScreens/Mark_Attendance.dart';
import 'package:reader/Screens/TeacherScreens/See_marks.dart';
import 'package:reader/Screens/TeacherScreens/see_Homework.dart';
import 'package:reader/Screens/TeacherScreens/teach_schedule.dart';
import 'package:reader/Screens/TeacherScreens/teach_see_att.dart';
import 'package:reader/Screens/TeacherScreens/teach_see_notices.dart';
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
  const TeacherHomePage(
      {super.key, required this.Teacher_HomePage, required this.ID});
  final List<dynamic> Teacher_HomePage;
  final String ID;

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
                    final studentRecords = await http.get(
                      Uri.parse(
                          "$Teacher_Base_url/get_class_records/${widget.Teacher_HomePage[3]}/${widget.Teacher_HomePage[4]}"),
                    );
                    if (studentRecords.statusCode == 200) {
                      List<dynamic> students = json.decode(studentRecords.body);
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

                    if (selectedValues["_cancel"] == "false") {
                      String section = selectedValues["section"] ?? "A";
                      int? standard =
                          int.tryParse(selectedValues["class"] ?? "1");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Give_HW(
                            Standard: standard ?? widget.Teacher_HomePage[3],
                            Section: section,
                            Subject: widget.Teacher_HomePage[5],
                          ),
                        ),
                      );
                    }
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
                      final studentRecords = await http.get(
                        Uri.parse(
                            "$Teacher_Base_url/get_class_records/$standard/${section}"),
                      );
                      if (studentRecords.statusCode == 200) {
                        List<dynamic> students =
                            json.decode(studentRecords.body);
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
                  onTap: () async {
                    final attRec = await http.get(
                      Uri.parse(
                          "$Teacher_Base_url/get_attendance/${widget.Teacher_HomePage[3]}/${widget.Teacher_HomePage[4]}"),
                    );
                    print(attRec.statusCode);
                    if (attRec.statusCode == 200) {
                      List<dynamic> Attendance = json.decode(attRec.body);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Teac_see_att(
                            Att_rec: Attendance,
                          ),
                        ),
                      );
                    }
                  },
                ),
                CustomCardViewone(
                  title: "View Homework ",
                  icon: Icons.app_registration,
                  onTap: () async {
                    Map<String, String> selectedValues =
                        await Select_Class(context);
                    String selectedClass = selectedValues["class"] ?? "1";
                    String selectedSection = selectedValues["section"] ?? "A";
                    final homeWorkResponse = await http.get(
                      Uri.parse(
                          "$Teacher_Base_url/fetch_homework/${selectedClass}/${selectedSection}/${widget.Teacher_HomePage[5]}"),
                    );
                    if (homeWorkResponse.statusCode == 200) {
                      List<dynamic> homeWork =
                          json.decode(homeWorkResponse.body);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Teach_Homework(Homework: homeWork),
                        ),
                      );
                    }
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
                    final marksRec = await http.get(
                      Uri.parse(
                          "$Teacher_Base_url/get_marks/${selectedClass}/${selectedSection}/${widget.Teacher_HomePage[5]}"),
                    );
                    if (marksRec.statusCode == 200) {
                      List<dynamic> marksBody = json.decode(marksRec.body);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              tech_See_Marks(Marks_List: marksBody),
                        ),
                      );
                    }
                  },
                ),
                CustomCardViewone(
                    title: "See Schedule",
                    icon: Icons.library_books,
                    onTap: () async {
                      String schedId =
                          "${widget.Teacher_HomePage[0]} => ${widget.Teacher_HomePage[5]}s";
                      final response = await http.get(
                        Uri.parse("$Teacher_Base_url/Fetch_Schedule/${schedId}"),
                      );
                      if (response.statusCode == 200) {
                        List<dynamic> responsebody = json.decode(response.body);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherSchedule(schId: schedId, teacherSchedule: responsebody,)));
                      }
                    }),
                CustomCardViewone(
                    title: "Notices",
                    icon: Icons.library_books,
                    onTap: () async {
                      final response = await http.get(
                        Uri.parse("$Teacher_Base_url/notices"),
                      );
                      if (response.statusCode == 200) {
                        List<dynamic> jsonResponse = json.decode(response.body);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => See_Notices_teacher(
                              noticelist: jsonResponse,
                              Standard: widget.Teacher_HomePage[3],
                              ID: widget.ID,
                            ),
                          ),
                        );
                      }
                    }),
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
