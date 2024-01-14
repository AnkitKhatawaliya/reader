import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reader/Screens/ParentScreens/Parent_HomeWork.dart';
import 'package:reader/Screens/ParentScreens/Parent_Notices.dart';
import 'package:reader/Screens/ParentScreens/Parent_TimeTable.dart';
import 'package:reader/Screens/ParentScreens/parentAtt.dart';
import 'package:reader/Screens/ParentScreens/parent_Marks.dart';
import 'package:reader/Widgets/CustomCard.dart';
import 'package:reader/Widgets/Logout_BOX.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:reader/Workflow/Base_URLs.dart';
import 'package:reader/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen(
      {super.key,
      required this.Parent_HomePage,
      required this.standard,
      required this.section});
  final List<dynamic> Parent_HomePage;
  final String standard;
  final String section;

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  String Name = "____";
  String ParentName = "____";
  String Roll_NO = "____";
  String DOB = "____";
  String Gender = "____";
  String Adm_no = "____";
  String Parent_No = "____";
  String Today_status = "Today's  Attendance Status: Not Marked Yet.";

  @override
  Widget build(BuildContext context) {
    late List<dynamic> attendanceRecord = [];
    late List<dynamic> marksRecord = [];
    int present = 0;
    int Count = 0;
    for (int i = 0; i < widget.Parent_HomePage.length; i++) {
      widget.Parent_HomePage[i][0] = Formatted_Date(widget.Parent_HomePage[i][0]);
      if (widget.Parent_HomePage[i][1] == "Name") {
        Name = widget.Parent_HomePage[i][2];
      } else if (widget.Parent_HomePage[i][1] == "Roll_No") {
        Roll_NO = widget.Parent_HomePage[i][2];
      } else if (widget.Parent_HomePage[i][1] == "Adm_NO") {
        Adm_no = widget.Parent_HomePage[i][2];
      } else if (widget.Parent_HomePage[i][1] == "D.O.B") {
        DOB = widget.Parent_HomePage[i][2];
      } else if (widget.Parent_HomePage[i][1] == "Gender") {
        Gender = widget.Parent_HomePage[i][2];
      } else if (widget.Parent_HomePage[i][1] == "Parent_Name") {
        ParentName = widget.Parent_HomePage[i][2];
      } else if (widget.Parent_HomePage[i][1] == "Parent_NO") {
        Parent_No = widget.Parent_HomePage[i][2];
      } else if (widget.Parent_HomePage[i][1] == "Attendance") {
        Count = Count+1;
        attendanceRecord.add(widget.Parent_HomePage[i]);
        Today_status = "Today's Attendance Status: Not Marked Yet.  Total = $present/$Count";
        if(widget.Parent_HomePage[i][2] == "Present") {
          present = present + 1;
          Today_status =
          "Today's Attendance Status: Not Marked Yet.  Total = $present/$Count";
        }
          if (widget.Parent_HomePage[i][0] == "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}") {
            if (widget.Parent_HomePage[i][2] == "Leave"){
              Today_status = "Today's Attendance Status: On Leave.  Total = $present/$Count";
            }
            if (widget.Parent_HomePage[i][2] == "Present"){
              Today_status = "Today's Attendance Status: Present.  Total = $present/$Count";
            }
            if (widget.Parent_HomePage[i][2] == "Absent"){
              Today_status = "Today's Attendance Status: Leave.  Total = $present/$Count";
            }

        }
      } else if (widget.Parent_HomePage[i][1] == "Password"|| widget.Parent_HomePage[i][1] == "Parent_PSD") {
      }
      else{
        marksRecord.add(widget.Parent_HomePage[i]);
      }
    }
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
          backgroundColor: Colors.tealAccent.shade700,
          title: const Text("Welcome  Guardian"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Student_Card(context),
                Divider(
                  color: Colors.tealAccent.shade400,
                ),
                Text(
                  Today_status,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.tealAccent.shade400,
                ),
                CustomCardViewone(
                    title: "See Attendance Records",
                    icon: Icons.app_registration,
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 50), () {
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>parentSeeAtt(Attendance: attendanceRecord, Name: Name, Adm_no: Adm_no, standard: widget.standard, section: widget.section)));
                    }),
                CustomCardViewone(
                      title: "Today's HomeWork",
                    icon: Icons.home_work_outlined,
                    onTap: () async {
                      final response = await http.get(
                        Uri.parse(
                            "$Client_Base_url/Home_Work/${widget.standard}/${widget.section}"),
                      );
                      print(response.statusCode);
                      if(response.statusCode == 200){
                        List<dynamic> jsonResponse = json.decode(response.body);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Parent_HomeWork(Homework_List: jsonResponse, Name: Name, Adm_no: Adm_no, standard: widget.standard, section: widget.section)));
                      }
                    }),
                CustomCardViewone(
                    title: "Marks Records",
                    icon: Icons.note_add_outlined,
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 50), () {
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Parent_Marks(Marks_records: marksRecord, Name: Name, Adm_no: Adm_no, standard: widget.standard, section: widget.section)));

                    }),
                CustomCardViewone(
                    title: "Notices",
                    icon: Icons.view_comfy_outlined,
                    onTap: () async {
                      final response = await http.get(
                        Uri.parse(
                            "$Client_Base_url/Notices/${widget.standard}/${widget.section}"),
                      );
                      print(response.statusCode);
                      if(response.statusCode == 200){
                        List<dynamic> jsonResponse = json.decode(response.body);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Parent_Notices(Notice_List: jsonResponse, Name: Name, Adm_no: Adm_no, standard: widget.standard, section: widget.section)));
                      }
                    }),
                CustomCardViewone(
                    title: "Time Table",
                    icon: Icons.library_books,
                    onTap: () async {
                      final response = await http.get(
                        Uri.parse(
                            "$Client_Base_url/Time_table/${widget.standard}/${widget.section}"),
                      );
                      print(response.statusCode);
                      if(response.statusCode == 200){
                        List<dynamic> jsonResponse = json.decode(response.body);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Parent_TimeTable(TimeTable_List: jsonResponse,Name: Name, Adm_no: Adm_no, standard: widget.standard, section: widget.section)));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack Student_Card(BuildContext context) {
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
                        Name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      const Text(
                        "Student",
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
                                const Text("Adm NO"),
                                Text(": " + Adm_no),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Class"),
                                Text(
                                    ": ${widget.standard}  ${widget.section} "),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.36,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.32,
            child: Image.network(
              "$Client_Base_url/Image/$Adm_no",
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

Formatted_Date(String Date) {
  List<String> dateParts = Date.split('-');
  String year = dateParts[0];
  String month = dateParts[1];
  String day = dateParts[2];
  String formattedDate = "$day-$month-$year";
  return formattedDate;
}

Future<void> logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("is_parent_login", false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Home_Screen()));
}
