import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reader/Workflow/Base_URLs.dart';

class Give_HW extends StatefulWidget {
  const Give_HW(
      {super.key,
      required this.Standard,
      required this.Section,
      required this.Subject});
  final int Standard;
  final String Section;
  final String Subject;

  @override
  State<Give_HW> createState() => _Give_HWState();
}

class _Give_HWState extends State<Give_HW> {
  TextEditingController _homeHork = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text("Give Homework "),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Over_Images(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Row(children: [
                          const Text(
                            "Subject  > ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            widget.Subject,
                            style: TextStyle(
                              color: Colors.cyan.shade400,
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          )
                        ])
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Day  > ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                          ),
                        ),
                        Text(
                          "${DateFormat('EEEE').format(DateTime.now())}           ",
                          style: TextStyle(
                            color: Colors.cyan.shade400,
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(children: [
                    const Text(
                      "Homework for > ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      "${widget.Standard}  ${widget.Section}",
                      style: TextStyle(
                        color: Colors.cyan.shade400,
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                    ),
                  ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: SizedBox(
                    height: double.infinity,
                    child: TextField(
                      controller: _homeHork,
                      maxLines: 10,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade50,
                        labelText: "Add Homework",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
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

  void uploadToServer() async {
    if (_homeHork.text.isEmpty) {
      print("Homework is empty. Please add homework before uploading.");
      return;
    }

    final apiUrl = '${Teacher_Base_url}/Add_Homework';

    final data = {
      "Standard": widget.Standard,
      "Section": widget.Section,
      "Subject": widget.Subject,
      "Day": DateFormat('EEEE').format(DateTime.now()),
      "Homework": _homeHork.text,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print("Homework added successfully");
    } else {
      print("Failed to add homework. Status code: ${response.statusCode}");
    }
  }
}
