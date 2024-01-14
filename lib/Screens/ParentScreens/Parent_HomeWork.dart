import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:reader/Workflow/Base_URLs.dart';

class Parent_HomeWork extends StatefulWidget {
  const Parent_HomeWork(
      {super.key,
      required this.Homework_List,
      required this.Name,
      required this.Adm_no,
      required this.standard,
      required this.section});
  final List<dynamic> Homework_List;
  final String Name;
  final String Adm_no;
  final String standard;
  final String section;
  @override
  State<Parent_HomeWork> createState() => _Parent_HomeWorkState();
}

class _Parent_HomeWorkState extends State<Parent_HomeWork> {
  String currentDayOfWeek = DateFormat('EEEE').format(DateTime.now());
  List<int> seq = List<int>.filled(6, 0);
  List<String> days = List<String>.filled(6, "No day");
  @override
  Widget build(BuildContext context) {
    if (currentDayOfWeek == "Monday") {
      seq = [4, 9, 8, 7, 6, 5];
      days = [
        "Monday",
        "Saturday",
        "Friday",
        "Thursday",
        "Wednesday",
        "Tuesday"
      ];
    } else if (currentDayOfWeek == "Tuesday") {
      seq = [5, 4, 9, 8, 7, 6];
      days = [
        "Tuesday",
        "Monday",
        "Saturday",
        "Friday",
        "Thursday",
        "Wednesday"
      ];
    } else if (currentDayOfWeek == "Wednesday") {
      seq = [6, 5, 4, 9, 8, 7];
      days = [
        "Wednesday",
        "Tuesday",
        "Monday",
        "Saturday",
        "Friday",
        "Thursday"
      ];
    } else if (currentDayOfWeek == "Thursday") {
      seq = [7, 6, 5, 4, 9, 8];
      days = [
        "Thursday",
        "Wednesday",
        "Tuesday",
        "Monday",
        "Saturday",
        "Friday"
      ];
    } else if (currentDayOfWeek == "Friday") {
      seq = [8, 7, 6, 5, 4, 9];
      days = [
        "Friday",
        "Thursday",
        "Wednesday",
        "Tuesday",
        "Monday",
        "Saturday"
      ];
    } else {
      seq = [9, 8, 7, 6, 5, 4];
      days = [
        "Saturday",
        "Friday",
        "Thursday",
        "Wednesday",
        "Tuesday",
        "Monday"
      ];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text("Weekly Homework"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Student_Card(context),
            Divider(
              color: Colors.tealAccent.shade400,
              endIndent: 12,
              indent: 12,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, top: 8, bottom: 8),
              child: Row(
                children: [
                  Text(
                    "HomeWork",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.tealAccent.shade400,
              endIndent: 12,
              indent: 12,
            ),
            // SizedBox(
            //   height: 30,
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0,top: 30,bottom: 20),
                                child: Text(days[index],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                              ),
                              const Text("Swipe for Yesterday's >>>",style: TextStyle(fontSize: 12),),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * .4,
                          child: ListView.builder(
                              itemCount: widget.Homework_List.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("${widget.Homework_List[i][3]} ",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.cyan.shade900)),
                                      Text(
                                          ":  ${widget.Homework_List[i][seq[index]]}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blueGrey)),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    );
                  }),
            )
          ],
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
                        widget.Name,
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
                                Text(": ${widget.Adm_no}"),
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
              "$Client_Base_url/Image/${widget.Adm_no}",
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
