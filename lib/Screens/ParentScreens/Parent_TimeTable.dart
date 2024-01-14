import 'package:flutter/material.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:reader/Workflow/Base_URLs.dart';

class Parent_TimeTable extends StatefulWidget {
  const Parent_TimeTable(
      {super.key,
      required this.TimeTable_List,
      required this.Name,
      required this.Adm_no,
      required this.standard,
      required this.section});
  final List<dynamic> TimeTable_List;
  final String Name;
  final String Adm_no;
  final String standard;
  final String section;

  @override
  State<Parent_TimeTable> createState() => _Parent_TimeTableState();
}

class _Parent_TimeTableState extends State<Parent_TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          title: const Text("Time Table  "),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Student_Card(context),
              Divider(
                color: Colors.tealAccent.shade400,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24.0, top: 12, bottom: 12),
                child: Row(
                  children: [
                    Text("Time Table",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                  ],
                ),
              ),
              Divider(
                color: Colors.tealAccent.shade400,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 4,
                    child: Column(
                      children: [
                         const SizedBox(
                          height: 40,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Weekday"),
                                Text("Lect-1"),
                                Text("Lect-2"),
                                Text("Lect-3"),
                                Text("Lect-4"),
                                Text("Lect-5"),
                                Text("Lect-6"),
                                Text("Lect-7"),
                                Text("Lect-8"),
                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.TimeTable_List.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(" ${widget.TimeTable_List[index][2]}"),
                                      Text(" ${widget.TimeTable_List[index][3]}"),
                                      Text(" ${widget.TimeTable_List[index][4]}"),
                                      Text(" ${widget.TimeTable_List[index][5]}"),
                                      Text(" ${widget.TimeTable_List[index][6]}"),
                                      Text(" ${widget.TimeTable_List[index][7]}"),
                                      Text(" ${widget.TimeTable_List[index][8]}"),
                                      Text(" ${widget.TimeTable_List[index][9]}"),
                                      Text(" ${widget.TimeTable_List[index][10]}"),

                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    )),
              ),
            ],
          ),
        ));
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

Formatted_Date(String Date) {
  List<String> dateParts = Date.split('-');
  String year = dateParts[0];
  String month = dateParts[1];
  String day = dateParts[2];
  String formattedDate = "$day-$month-$year";
  return formattedDate;
}
