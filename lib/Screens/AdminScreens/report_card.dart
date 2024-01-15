import 'package:flutter/material.dart';
import 'package:reader/Workflow/Base_URLs.dart';

class ReportCard extends StatefulWidget {
  const ReportCard(
      {super.key,
      required this.studentRecord,
      required this.standard,
      required this.section});
  final List<dynamic> studentRecord;
  final String standard;
  final String section;

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  String Name = "____";
  String ParentName = "____";
  String Roll_NO = "____";
  String DOB = "____";
  String Gender = "____";
  String Adm_no = "____";
  String Parent_No = "____";
  @override
  Widget build(BuildContext context) {
    late List<dynamic> attendanceRecord = [];
    late List<dynamic> marksRecord = [];
    int present = 0;
    int Count = 0;
    for (int i = 0; i < widget.studentRecord.length; i++) {
      widget.studentRecord[i][0] = Formatted_Date(widget.studentRecord[i][0]);
      if (widget.studentRecord[i][1] == "Name") {
        Name = widget.studentRecord[i][2];
      } else if (widget.studentRecord[i][1] == "Roll_No") {
        Roll_NO = widget.studentRecord[i][2];
      } else if (widget.studentRecord[i][1] == "Adm_NO") {
        Adm_no = widget.studentRecord[i][2];
      } else if (widget.studentRecord[i][1] == "D.O.B") {
        DOB = widget.studentRecord[i][2];
      } else if (widget.studentRecord[i][1] == "Gender") {
        Gender = widget.studentRecord[i][2];
      } else if (widget.studentRecord[i][1] == "Parent_Name") {
        ParentName = widget.studentRecord[i][2];
      } else if (widget.studentRecord[i][1] == "Parent_NO") {
        Parent_No = widget.studentRecord[i][2];
      } else if (widget.studentRecord[i][1] == "Attendance") {
        Count = Count + 1;
        attendanceRecord.add(widget.studentRecord[i]);
        if (widget.studentRecord[i][2] == "Present") {
          present = present + 1;
        }
      } else if (widget.studentRecord[i][1] == "Password" ||
          widget.studentRecord[i][1] == "Parent_PSD") {
      } else {
        marksRecord.add(widget.studentRecord[i]);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Card'),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Name : $Name",
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Guardian : $ParentName",
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "DOB : $DOB",
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Adm NO : $Adm_no",
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Cont : $Parent_No",
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    width: 120,
                    height: 150,
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.network(
                      fit: BoxFit.fitWidth,
                      "$Client_Base_url/Image/$Adm_no",
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
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              indent: 10,
              thickness: 1,
              endIndent: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  alignment: AlignmentDirectional.centerStart,
                  child: const Text(
                    "Attendance",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(right: 18, top: 10, bottom: 10),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Total : $present/$Count",
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: attendanceRecord.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.blueGrey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                  Formatted_Date(attendanceRecord[index][0])),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(attendanceRecord[index][2]),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const Divider(
              color: Colors.black,
              indent: 10,
              thickness: 1,
              endIndent: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                "Marks",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: marksRecord.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.blueGrey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      height: 65,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12, top: 8),
                                child: Text("Subject : " +
                                    marksRecord[index][1].split('_')[0]),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 8),
                                child: Text("Date : " +
                                    Formatted_Date(marksRecord[index][0])),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("Max marks : " +
                                    marksRecord[index][1].split('_')[1]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 12, bottom: 8),
                                child:
                                    Text("Obtained : " + marksRecord[index][2]),
                              )
                            ],
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
