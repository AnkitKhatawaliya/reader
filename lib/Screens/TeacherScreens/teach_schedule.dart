import 'package:flutter/material.dart';
import 'package:reader/Widgets/Over_Images.dart';

class TeacherSchedule extends StatefulWidget {
  const TeacherSchedule(
      {super.key, required this.schId, required this.teacherSchedule});
  final List<dynamic> teacherSchedule;
  final String schId;

  @override
  State<TeacherSchedule> createState() => _TeacherScheduleState();
}

class _TeacherScheduleState extends State<TeacherSchedule> {
  @override
  Widget build(BuildContext context) {
    late List<dynamic> monday = [
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant"
    ];
    late List<dynamic> tuesday = [
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant"
    ];
    late List<dynamic> wednesday = [
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant"
    ];
    late List<dynamic> thursday = [
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant"
    ];
    late List<dynamic> friday = [
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant"
    ];
    late List<dynamic> saturday = [
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant",
      "Vacant"
    ];

    for (int i = 0; i < widget.teacherSchedule.length; i++) {
      if (widget.teacherSchedule[i][2] == "Monday") {
        for (int j = 3; j < 11; j++) {
          if (widget.teacherSchedule[i][j] == widget.schId) {
            monday[j - 3] =
                "${widget.teacherSchedule[i][0]} ${widget.teacherSchedule[i][1]}";
          }
        }
      } else if (widget.teacherSchedule[i][2] == "Tuesday") {
        for (int j = 3; j < 11; j++) {
          if (widget.teacherSchedule[i][j] == widget.schId) {
            tuesday[j - 3] =
                "${widget.teacherSchedule[i][0]} ${widget.teacherSchedule[i][1]}";
          }
        }
      } else if (widget.teacherSchedule[i][2] == "Wednesday") {
        for (int j = 3; j < 11; j++) {
          if (widget.teacherSchedule[i][j] == widget.schId) {
            wednesday[j - 3] =
                "${widget.teacherSchedule[i][0]} ${widget.teacherSchedule[i][1]}";
          }
        }
      } else if (widget.teacherSchedule[i][2] == "Thursday") {
        for (int j = 3; j < 11; j++) {
          if (widget.teacherSchedule[i][j] == widget.schId) {
            thursday[j - 3] =
                "${widget.teacherSchedule[i][0]} ${widget.teacherSchedule[i][1]}";
          }
        }
      } else if (widget.teacherSchedule[i][2] == "Friday") {
        for (int j = 3; j < 11; j++) {
          if (widget.teacherSchedule[i][j] == widget.schId) {
            friday[j - 3] =
                "${widget.teacherSchedule[i][0]} ${widget.teacherSchedule[i][1]}";
          }
        }
      } else if (widget.teacherSchedule[i][2] == "Saturday") {
        for (int j = 3; j < 11; j++) {
          if (widget.teacherSchedule[i][j] == widget.schId) {
            saturday[j - 3] =
                "${widget.teacherSchedule[i][0]} ${widget.teacherSchedule[i][1]}";
          }
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text("Schedule"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Over_Images(),
            const Padding(
                padding: EdgeInsets.only(left: 25,bottom: 10),
                child: Text(
                  "Schedule",
                  style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                          child: const Text("  WeekDay"),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: const Center(child: Text("Lect-1"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: const Center(child: Text("Lect-2"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: const Center(child: Text("Lect-3"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: const Center(child: Text("Lect-4"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: const Center(child: Text("Lect-5"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: const Center(child: Text("Lect-6"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: const Center(child: Text("Lect-7"))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: const Center(child: Text("Lect-8"))),
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                          child: const Text("  Monday"),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(monday[0]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(monday[1]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(monday[2]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(monday[3]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(monday[4]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(monday[5]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(monday[6]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(monday[7]))),
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                          child: const Text("  Tuesday"),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(tuesday[0]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(tuesday[1]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(tuesday[2]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(tuesday[3]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(tuesday[4]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(tuesday[5]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(tuesday[6]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(tuesday[7]))),
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                          child: const Text("  Wednesday"),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(wednesday[0]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(wednesday[1]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(wednesday[2]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(wednesday[3]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(wednesday[4]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(wednesday[5]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(wednesday[6]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(wednesday[7]))),
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                          child: const Text("  Thursday"),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(thursday[0]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(thursday[1]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(thursday[2]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(thursday[3]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(thursday[4]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(thursday[5]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(thursday[6]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(thursday[7]))),
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                          child: const Text("  Friday"),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(friday[0]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(friday[1]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(friday[2]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(friday[3]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(friday[4]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(friday[5]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(friday[6]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(friday[7]))),
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                          child: const Text("  Saturday"),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(saturday[0]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(saturday[1]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(saturday[2]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(saturday[3]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(saturday[4]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(saturday[5]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(saturday[6]))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .22,
                            child: Center(child: Text(saturday[7]))),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
