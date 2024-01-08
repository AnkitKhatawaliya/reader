import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reader/Workflow/Base_URLs.dart';

class Give_Marks extends StatefulWidget {
  const Give_Marks(
      {super.key,
      required this.Standard,
      required this.Section,
      required this.Subject,
      required this.Students});
  final int Standard;
  final String Section;
  final String Subject;
  final List<dynamic> Students;

  @override
  State<Give_Marks> createState() => _Give_MarksState();
}

class _Give_MarksState extends State<Give_Marks> {
  List<TextEditingController> markControllers = [];
  final TextEditingController _maxMarks = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize markControllers for each student
    for (int i = 0; i < widget.Students[0].length-2; i++) {
      markControllers.add(TextEditingController());
      print("i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text("Give Marks "),
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
              Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Row(children: [
                  const Text(
                    "Marks for > ",
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
                ]),
              ]),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(children: [
                    const Text(
                      "Class > ",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _maxMarks,
                        decoration: InputDecoration(
                            labelText: "Enter max",
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        onPressed: () {
                          uploadToServer();
                        },
                        child: Text("Upload to server",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ))),
                  )
                ],
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
                              width: 36,
                              child: Center(
                                child: Text(
                                  "${widget.Students[0][index + 2]}",
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  SizedBox(
                                    width: 140,
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: markControllers[index],
                                        decoration: InputDecoration(
                                            labelText: "Enter max",
                                            filled: true,
                                            fillColor: Colors.teal.shade100,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue))),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> uploadToServer() async {
    bool allMarksEntered = true;
    for (int i = 0; i < widget.Students[0].length-2; i++) {
      if (markControllers[i].text.isEmpty || _maxMarks.text.isEmpty) {
        allMarksEntered = false;
        break;
      }
    }
    if(allMarksEntered == true){
      print("Yes");
      Map<String, String> dict = {};

      for (int i = 0; i < markControllers.length; i++) {
        dict[(i + 1).toString()] = markControllers[i].text;
      }
      print(dict);
      try {
        final response = await http.post(
          Uri.parse("$Teacher_Base_url/Give_marks/${widget.Standard}/${widget.Section}/${widget.Subject}/${_maxMarks.text}"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(dict),
        );
        if (response.statusCode == 200) {
          print("working");
        } else {}
      } catch (e) {}

    }else{
      print("No god");

    }
  }
}


