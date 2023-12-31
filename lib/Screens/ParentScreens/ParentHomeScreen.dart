import 'package:flutter/material.dart';
import 'package:reader/Widgets/CustomCard.dart';
import 'package:reader/Widgets/Student_Card.dart';

class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen({super.key});

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  String url = "https://picsum.photos/200";
  late String todayattstatus;

  int i = 1, j = 1;
  @override
  void initState() {
    super.initState();
    if (i < j) {
      todayattstatus = "Present";
    } else if (i > j) {
      todayattstatus = "Absent";
    } else {
      todayattstatus = "Attendance isn't Market Yet.";
    }
  }

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
              StudentCard(
                url: url,
                name: 'Harsh Vardhan',
                standard: '12th',
                attendance: '12/15',
                roll_no: '12',
              ),
              Divider(
                color: Colors.tealAccent.shade400,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Today's status : ",
                      style: TextStyle(color: Colors.black54, fontSize: 24),
                    ),
                    Text(
                      todayattstatus,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.tealAccent.shade400,
              ),
              CustomCardViewone(
                title: "See Attendance Records",
                icon: Icons.app_registration,
                onTap: () {}
              ),
              CustomCardViewone(
                title: "Today's HomeWork",
                icon: Icons.home_work_outlined,
                onTap: () {}
              ),
              CustomCardViewone(
                title: "Marks Records",
                icon: Icons.note_add_outlined,
                onTap: () {}
              ),
              CustomCardViewone(
                title: "Notifications",
                icon: Icons.view_comfy_outlined,
                onTap: () {}
              ),
              CustomCardViewone(
                title: "Calendar",
                icon: Icons.library_books,
                onTap: () {}
              ),
              CustomCardViewone(
                title: "Talk with Teachers",
                icon: Icons.library_books,
                onTap: () {}
              ),
              CustomCardViewone(
                title: "Log Out",
                icon: Icons.logout_outlined,
                onTap: () {}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
