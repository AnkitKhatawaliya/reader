import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reader/Screens/AdminScreens/report_card.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:http/http.dart' as http;
import 'package:reader/Workflow/Base_URLs.dart';

class AllStudents extends StatefulWidget {
  const AllStudents(
      {Key? key,
      required this.studentList,
      required this.standard,
      required this.section})
      : super(key: key);
  final List<dynamic>? studentList;
  final String standard;
  final String section;

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  int findMax() {
    List<dynamic> yourList = widget.studentList?[1] ?? '';
    int max = yourList.length;
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Students'),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Over_Images(),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 12, bottom: 12),
              child: Row(
                children: [
                  Text("Class ${widget.standard} ${widget.section}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28)),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  itemCount: findMax()-2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        final response = await http.get(
                          Uri.parse(
                              "$Admin_Base_url/Student_Info/${widget.standard}/${widget.section}/${widget.studentList?[1][index + 2] ?? ''}"),
                        );
                        if(response.statusCode == 200){
                          List<dynamic> jsonResponse = json.decode(response.body);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReportCard(standard: widget.standard, section: widget.section, studentRecord: jsonResponse,),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.all(8),
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 8, top: 8),
                              child: Column(
                                children: [
                                  const Text(
                                    "Roll NO:",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 16),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(
                                    "${widget.studentList?[1][index + 2] ?? ''}",
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              indent: 10,
                              endIndent: 10,
                              width: 2,
                              color: Colors.blueGrey,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:MediaQuery.of(context).size.width*.75,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(padding: const EdgeInsets.only(top: 12,left: 8,right: 30),child: Row(
                                        children: [
                                          const Text("Name : ",style: TextStyle(color: Colors.blueGrey),),
                                          Text("${widget.studentList?[2][index+2] ?? ''}",style: const TextStyle(fontSize: 18),),
                                        ],
                                      ),),
                                      Padding(padding: const EdgeInsets.only(top: 12,right: 8),child: Row(
                                        children: [
                                          const Text("Adm NO : ",style: TextStyle(color: Colors.blueGrey),),
                                          Text("${widget.studentList?[0][index+2] ?? ''}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                        ],
                                      ),)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:MediaQuery.of(context).size.width*.75,
                                  child: Row(
                                    children: [
                                      Padding(padding: const EdgeInsets.only(top: 18,left: 16),child: Row(
                                        children: [
                                          const Text("    Parent's Name : ",style: TextStyle(color: Colors.blueGrey),),
                                          Text("${widget.studentList?[5][index+2] ?? ''}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                                        ],
                                      ),),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   width:MediaQuery.of(context).size.width*.75,
                                //   child: Row(
                                //     children: [
                                //       Padding(padding: const EdgeInsets.only(top: 7,left: 16),child: Row(
                                //         children: [
                                //           const Text("Parent's NO : ",style: TextStyle(color: Colors.blueGrey),),
                                //           Text("${widget.studentList?[6][index+2] ?? ''}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                                //         ],
                                //       ),),
                                //     ],
                                //   ),
                                // )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
