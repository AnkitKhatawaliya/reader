import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:reader/Screens/TeacherScreens/TeacherHomePage.dart';
import 'package:reader/Screens/TeacherScreens/teach_see_notices.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:reader/Workflow/Base_URLs.dart';
import 'package:http/http.dart' as http;


class tech_add_notice extends StatefulWidget {
  const tech_add_notice(
      {super.key, required this.Standard, required this.Section, required this.ID});
  final int Standard;
  final String Section;
  final String ID;

  @override
  State<tech_add_notice> createState() => _tech_add_noticeState();
}

class _tech_add_noticeState extends State<tech_add_notice> {
  DateTime? selectedDate;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _heading = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Add a Notice",
              style: TextStyle(fontSize: 30, color: Colors.white70),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Over_Images(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    const Text(
                      "Add a Notice",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String title = _title.toString().trim();
                        String heading = _heading.toString().trim();
                        String description = _description.toString().trim();

                        if (title.isEmpty ||
                            heading.isEmpty ||
                            description.isEmpty ||
                            selectedDate == null) {
                          print("Please fill in all required fields.");
                        } else {
                          String formattedDate =
                              "${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}";
                          Map<String, dynamic> postData = {
                            "Title": title,
                            "Heading": heading,
                            "Description": description,
                            "for_date": formattedDate,
                            "Standard": widget.Standard,
                            "Section": widget.Section,
                          };
                          final response = await http.post(
                            Uri.parse("$Teacher_Base_url/notice"),
                            body: postData,
                          );
                          if (response.statusCode == 200) {
                            print("Notice added successfully!");
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text(
                                          "Notice added successfully!"),
                                      content:
                                      const Text("Choose to navigate..."),
                                      actions: [
                                        TextButton(
                                            onPressed: () async {
                                              await Future.delayed(const Duration(seconds: 1));
                                              final info = await http.get(
                                                Uri.parse(
                                                    "$Teacher_Base_url/homepage_info/${widget.ID}"),
                                              );
                                              List<dynamic> hp_info = json.decode(info.body)[0];
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => TeacherHomePage(Teacher_HomePage: hp_info, ID: widget.ID,),
                                                ),
                                              );
                                            },
                                            child: const Text("HomePage")),
                                        TextButton(
                                            onPressed: () async {
                                              final response = await http.get(
                                                Uri.parse("$Teacher_Base_url/notices"),
                                              );
                                              if (response.statusCode == 200) {
                                                List<dynamic> jsonResponse = json.decode(response.body);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        See_Notices_teacher(noticelist: jsonResponse, Standard: widget.Standard, ID: widget.ID,),
                                                  ),
                                                );
                                              }
                                            },
                                            child: const Text("See Notices"))
                                      ]);
                                });
                          } else {
                            print(
                                "Failed to add notice. Status code: ${response.statusCode}");
                          }

                        }
                      },
                      child: const Text("PUBLISH"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Notice will only be added for Class: ${widget.Standard} Section : ${widget.Section}",
                  style: const TextStyle(fontSize: 16),
                ),
                GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(
                              'To add notice for the whole school. Contact admin.'),
                        ),
                      );
                    },
                    child: const Icon(Icons.info))
              ],
            ),
            Card(
              color: Colors.grey.shade300,
              elevation: 12,
              margin: const EdgeInsets.only(top: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("   Add Title  ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 23,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _title,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade50,
                                labelText: "Enter the Title",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("  Target Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 23,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  DateTime? datePicked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2026));
                                  if (datePicked != null) {
                                    setState(() {
                                      selectedDate = datePicked;
                                    });
                                  }
                                },
                                child: const Text(
                                  "Select Date",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: selectedDate != null
                                        ? Text(
                                            "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                            style:
                                                const TextStyle(fontSize: 14),
                                          )
                                        : const Text(
                                            ""), // Display nothing if date is not selected
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "   Heading  ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _heading,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade50,
                                labelText: "Heading for Notice",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "   Description  ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 23,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: SizedBox(
                        height: double.infinity,
                        child: TextField(
                          controller: _description,
                          maxLines: 10,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade50,
                            labelText: "Max 250 Words...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
