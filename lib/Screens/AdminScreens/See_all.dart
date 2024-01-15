import 'package:flutter/material.dart';
import 'package:reader/Widgets/Over_Images.dart';

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
  int findmax() {
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
                  itemCount: findmax()-2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
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
                                      Padding(padding: EdgeInsets.only(top: 12,left: 8,right: 30),child: Row(
                                        children: [
                                          Text("Name : ",style: TextStyle(color: Colors.blueGrey),),
                                          Text("${widget.studentList?[2][index+2] ?? ''}",style: TextStyle(fontSize: 18),),
                                        ],
                                      ),),
                                      Padding(padding: EdgeInsets.only(top: 12,right: 8),child: Row(
                                        children: [
                                          Text("Adm NO : ",style: TextStyle(color: Colors.blueGrey),),
                                          Text("${widget.studentList?[0][index+2] ?? ''}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                        ],
                                      ),)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:MediaQuery.of(context).size.width*.75,
                                  child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 7,left: 16),child: Row(
                                        children: [
                                          Text("Parent's Name : ",style: TextStyle(color: Colors.blueGrey),),
                                          Text("${widget.studentList?[5][index+2] ?? ''}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                                        ],
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:MediaQuery.of(context).size.width*.75,
                                  child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 7,left: 16),child: Row(
                                        children: [
                                          Text("Parent's NO : ",style: TextStyle(color: Colors.blueGrey),),
                                          Text("${widget.studentList?[6][index+2] ?? ''}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                                        ],
                                      ),),
                                    ],
                                  ),
                                )

                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
            // SizedBox(
            //   height: 500,
            //   child: ListView.builder(
            //     itemCount: findmax()-2,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         width: double.maxFinite,
            //         margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            //         height: MediaQuery.of(context).size.height * 0.1,
            //         decoration: BoxDecoration(
            //           color: Colors.blueGrey.shade100,
            //           borderRadius: BorderRadius.circular(12.0),
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Flexible(
            //               flex: 1,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   const SizedBox(),
            //                   const Text(
            //                     "Roll NO:",
            //                     style: TextStyle(color: Colors.blue, fontSize: 16),
            //                   ),
            //                   Text(
            //                     "  ${widget.studentList?[1][index+2] ?? ''}",
            //                     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             VerticalDivider(
            //               width: 2,
            //               color: Colors.blueGrey.shade800,
            //             ),
            //             Flexible(
            //               flex: 2,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       const Text(
            //                         "Adm NO:",
            //                         style: TextStyle(color: Colors.blue, fontSize: 16),
            //                       ),
            //                       Text(
            //                         "  ${widget.studentList?[0][index+2] ?? ''}",
            //                         style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //                       ),
            //                     ],
            //                   ),
            //                   Text(
            //                     "Name:   ${widget.studentList?[2][index+2] ?? ''}",
            //                     style: const TextStyle(color: Colors.black54),
            //                   ),
            //                   Row(
            //                     children: [
            //                       Text(
            //                         "Gender:   ${widget.studentList?[4][index+2] ?? ''}",
            //                         style: const TextStyle(color: Colors.black54),
            //                       ),
            //                       Text(
            //                         "       D.O.B:  ${widget.studentList?[3][index+2] ?? ''}",
            //                         style: const TextStyle(color: Colors.black54),
            //                       ),
            //                     ],
            //                   ),
            //                   Text(
            //                     "Parent's Name:   ${widget.studentList?[5][index+2] ?? ''}",
            //                     style: const TextStyle(color: Colors.black54),
            //                   ),
            //                   Text(
            //                     "Parent's No:   ${widget.studentList?[6][index+2] ?? ''}",
            //                     style: const TextStyle(color: Colors.black54),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
