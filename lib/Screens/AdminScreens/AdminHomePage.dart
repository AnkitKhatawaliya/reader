import 'package:flutter/material.dart';
import 'package:reader/Widgets/CustomCard.dart';

import '../../Widgets/Select_Class.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  Map<String, String> selectedValues = await Select_Class(context);
                  String selectedClass = selectedValues["class"] ?? "1";
                  String selectedSection = selectedValues["section"] ?? "A";
                  print("Selected Class: $selectedClass, Selected Section: $selectedSection");
                },
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Edit Class Records",
                icon: Icons.library_books,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Teachers",
                icon: Icons.backup_table,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Time Table",
                icon: Icons.calendar_view_week_outlined,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Calender",
                icon: Icons.calendar_month_outlined,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Notices",
                icon: Icons.notifications_active,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "See Suggestion Box",
                icon: Icons.add_business_outlined,
                onTap: () {},
                iconcolor: Colors.tealAccent.shade700,
                textcolor: Colors.blueGrey.shade400,
              ),
              CustomCardViewone(
                title: "Log Out",
                icon: Icons.logout,
                onTap: () {
                  Navigator.pop(context);
                },
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
