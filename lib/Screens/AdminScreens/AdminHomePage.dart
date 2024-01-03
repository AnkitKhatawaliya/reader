import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reader/Screens/AdminScreens/See_TimeTable.dart';
import 'package:reader/Screens/AdminScreens/See_all.dart';
import 'package:reader/Screens/AdminScreens/See_teachers.dart';
import 'package:reader/Widgets/CustomCard.dart';
import 'package:reader/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Widgets/Logout_BOX.dart';
import '../../Widgets/Over_Images.dart';
import '../../Widgets/Select_Class.dart';
import '../../Workflow/Base_URLs.dart';
import 'See_Notices.dart';

class admin_homepage extends StatefulWidget {
  const admin_homepage({Key? key}) : super(key: key);

  @override
  State<admin_homepage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<admin_homepage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          automaticallyImplyLeading: false,
          title: const Row(
            children: [
              Icon(
                Icons.admin_panel_settings,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Admin Panel",
                style: TextStyle(fontSize: 30, color: Colors.white70),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const Over_Images(),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    const Text(
                      "Welcome Admin",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),
                  ],
                ),
                CustomCardViewone(
                  title: "See Student Records",
                  icon: Icons.school,
                  onTap: () async {
                    Map<String, dynamic> selectedValues =
                        await Select_Class(context);

                    if (selectedValues["_cancel"] == "false") {
                      String section = selectedValues["section"] ?? "A";
                      int? standard =
                          int.tryParse(selectedValues["class"] ?? "1");
                      final response = await http.get(
                        Uri.parse(
                            "$Admin_Base_url/get_students/$standard/$section"),
                      );
                      if (response.statusCode == 200) {
                        List<dynamic> jsonResponse = json.decode(response.body);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AllStudents(studentList: jsonResponse),
                          ),
                        );
                      }
                    }
                  },
                ),
                CustomCardViewone(
                  title: "Teachers",
                  icon: Icons.backup_table,
                  onTap: () async {
                    final response = await http.get(
                      Uri.parse("$Admin_Base_url/teachers"),
                    );
                    if (response.statusCode == 200) {
                      List<dynamic> jsonResponse = json.decode(response.body);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SeeTeachers(teacherList: jsonResponse),
                        ),
                      );
                    }
                  },
                ),
                CustomCardViewone(
                  title: "Time Table",
                  icon: Icons.calendar_view_week_outlined,
                  onTap: () async {
                    Map<String, dynamic> selectedValues =
                        await Select_Class(context);

                    if (selectedValues["_cancel"] == "false") {
                      String section = selectedValues["section"] ?? "A";
                      int? standard =
                          int.tryParse(selectedValues["class"] ?? "1");
                      final response = await http.get(
                        Uri.parse(
                            "$Admin_Base_url/time_table/$standard/$section"),
                      );
                      if (response.statusCode == 200) {
                        List<dynamic> jsonResponse = json.decode(response.body);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                See_timeTable(timetablelist: jsonResponse),
                          ),
                        );
                      }
                    }
                  },
                ),
                CustomCardViewone(
                  title: "Notices",
                  icon: Icons.notifications_active,
                  onTap: () async {
                    final response = await http.get(
                      Uri.parse("$Admin_Base_url/notices"),
                    );
                    if (response.statusCode == 200) {
                      List<dynamic> jsonResponse = json.decode(response.body);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              See_notices(noticelist: jsonResponse),
                        ),
                      );
                    }
                  },
                ),
                CustomCardViewone(
                  title: "See Suggestion Box",
                  icon: Icons.add_business_outlined,
                  onTap: () {},
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
                            prefs.setBool("is_admin_login", false);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home_Screen()));
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
