import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reader/Widgets/Over_Images.dart';

class Teach_Homework extends StatefulWidget {
  const Teach_Homework({super.key, required this.Homework});
  final List<dynamic> Homework;

  @override
  State<Teach_Homework> createState() => _Teach_HomeworkState();
}

class _Teach_HomeworkState extends State<Teach_Homework> {
  String currentDayOfWeek = DateFormat('EEEE').format(DateTime.now());
  List<int> seq = List<int>.filled(6, 0);
  List<String> days = List<String>.filled(6, "No day");
  @override
  Widget build(BuildContext context) {
    if (currentDayOfWeek == "Monday") {
      seq = [3, 8, 7, 6, 5, 4];
      days = [
        "Monday",
        "Saturday",
        "Friday",
        "Thursday",
        "Wednesday",
        "Tuesday"
      ];
    } else if (currentDayOfWeek == "Tuesday") {
      seq = [4, 3, 8, 7, 6, 5];
      days = [
        "Tuesday",
        "Monday",
        "Saturday",
        "Friday",
        "Thursday",
        "Wednesday"
      ];
    } else if (currentDayOfWeek == "Wednesday") {
      seq = [5, 4, 3, 8, 7, 6];
      days = [
        "Wednesday",
        "Tuesday",
        "Monday",
        "Saturday",
        "Friday",
        "Thursday"
      ];
    } else if (currentDayOfWeek == "Thursday") {
      seq = [6, 5, 4, 3, 8, 7];
      days = [
        "Thursday",
        "Wednesday",
        "Tuesday",
        "Monday",
        "Saturday",
        "Friday"
      ];
    } else if (currentDayOfWeek == "Friday") {
      seq = [7, 6, 5, 4, 3, 8];
      days = [
        "Friday",
        "Thursday",
        "Wednesday",
        "Tuesday",
        "Monday",
        "Saturday"
      ];
    } else {
      seq = [8, 7, 6, 5, 4, 3];
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text("Homework "),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Over_Images(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Text(
                            "For ${widget.Homework[0][1]} ${widget.Homework[0][2]} ",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 23)),
                      ),
                      Text("Subject = ${widget.Homework[0][3]}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 23))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.45,
              child: ListView.builder(
                itemCount: 6,
                  itemBuilder: (context, index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(days[index],style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(widget.Homework[0][seq[index]],style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.blueGrey.shade200,
                        )
                      ],
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
