import 'package:flutter/material.dart';
import 'package:reader/Widgets/CustomCard.dart';
import 'package:reader/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/Logout_BOX.dart';
import '../../Widgets/Select_Class.dart';

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
                CustomCardViewone(
                  title: "See Student Records",
                  icon: Icons.school,
                  onTap: () async {
                    Map<String, dynamic> selectedValues =
                        await Select_Class(context);

                    if (selectedValues["_cancel"] == "false") {
                      String selectedClass = selectedValues["class"] ?? "1";
                      String selectedSection = selectedValues["section"] ?? "A";
                    }
                  },
                ),
                CustomCardViewone(
                  title: "Edit Class Records",
                  icon: Icons.library_books,
                  onTap: () async {
                    Map<String, dynamic> selectedValues =
                        await Select_Class(context);

                    if (selectedValues["_cancel"] == "false") {
                      String selectedClass = selectedValues["class"] ?? "1";
                      String selectedSection = selectedValues["section"] ?? "A";
                    }
                  },
                ),
                CustomCardViewone(
                  title: "Teachers",
                  icon: Icons.backup_table,
                  onTap: () {},
                ),
                CustomCardViewone(
                  title: "Time Table",
                  icon: Icons.calendar_view_week_outlined,
                  onTap: () {},
                ),
                CustomCardViewone(
                  title: "Calender",
                  icon: Icons.calendar_month_outlined,
                  onTap: () {},
                ),
                CustomCardViewone(
                  title: "Notices",
                  icon: Icons.notifications_active,
                  onTap: () {},
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
