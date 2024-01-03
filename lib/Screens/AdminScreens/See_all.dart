import 'package:flutter/material.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({Key? key, required this.studentList}) : super(key: key);
  final List<dynamic>? studentList;

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  int findmax(){
    List<dynamic> yourList = widget.studentList?[1] ?? '';
    int max =yourList.length;
    print("function called");
    return max;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Students'),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: ListView.builder(
        itemCount: findmax()-2,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(),
                      const Text(
                        "Roll NO:",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      Text(
                        "  ${widget.studentList?[1][index+2] ?? ''}",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 2,
                  color: Colors.blueGrey.shade800,
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Adm NO:",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          Text(
                            "  ${widget.studentList?[0][index+2] ?? ''}",
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "Name:   ${widget.studentList?[2][index+2] ?? ''}",
                        style: const TextStyle(color: Colors.black54),
                      ),
                      Row(
                        children: [
                          Text(
                            "Gender:   ${widget.studentList?[4][index+2] ?? ''}",
                            style: const TextStyle(color: Colors.black54),
                          ),
                          Text(
                            "       D.O.B:  ${widget.studentList?[3][index+2] ?? ''}",
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      Text(
                        "Parent's Name:   ${widget.studentList?[5][index+2] ?? ''}",
                        style: const TextStyle(color: Colors.black54),
                      ),
                      Text(
                        "Parent's No:   ${widget.studentList?[6][index+2] ?? ''}",
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
