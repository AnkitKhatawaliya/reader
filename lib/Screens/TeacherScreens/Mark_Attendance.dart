import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:reader/Workflow/Base_URLs.dart';

class Mark_attendance extends StatefulWidget {
  const Mark_attendance({Key? key, required this.Students, required this.Standard, required this.Section}) : super(key: key);
  final List<dynamic> Students;
  final int Standard;
  final String Section;

  @override
  State<Mark_attendance> createState() => _Mark_attendanceState();
}

class _Mark_attendanceState extends State<Mark_attendance> {
  List<String> currentOption = ["Present", "Absent", "Leave"];
  late List<String> attendanceStatusList =
      List<String>.filled(widget.Students[0].length - 2, "Present");

  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text("Mark Attendance "),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Mark attendance for >",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        " ${DateFormat('dd-MM-yyyy').format(DateTime.now())}",
                        style: TextStyle(
                          color: Colors.cyan.shade400,
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: widget.Students.isNotEmpty
                      ? widget.Students[0].length - 2
                      : 0,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade200,
                      margin: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            SizedBox(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  widget.Students[0][index + 2],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                              child: VerticalDivider(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, left: 4),
                                  child: Text(
                                    widget.Students[1][index + 2],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        value: currentOption[0],
                                        groupValue: attendanceStatusList[index],
                                        onChanged: (value) {
                                          setState(() {
                                            attendanceStatusList[index] =
                                                "Present";
                                          });
                                        },
                                      ),
                                      const Text('Present'),
                                      Radio<String>(
                                        value: currentOption[1],
                                        groupValue: attendanceStatusList[index],
                                        onChanged: (value) {
                                          setState(() {
                                            attendanceStatusList[index] =
                                                "Absent";
                                          });
                                        },
                                      ),
                                      const Text('Absent'),
                                      Radio<String>(
                                        value: currentOption[2],
                                        groupValue: attendanceStatusList[index],
                                        onChanged: (value) {
                                          setState(() {
                                            attendanceStatusList[index] =
                                                "Leave";
                                          });
                                        },
                                      ),
                                      const Text('Leave'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    uploadToServer();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade300),
                  child: const Text("Upload to Server",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 23,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadToServer() async {
    print(attendanceStatusList);
    Map<String, String> dict = {};

    for (int i = 0; i < attendanceStatusList.length; i++) {
      dict[(i + 1).toString()] = attendanceStatusList[i];
    }
    print(dict);

    try {
      final response = await http.post(
        Uri.parse("$Teacher_Base_url/mark_attendance/${widget.Standard}/${widget.Section}"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dict),
      );
      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
