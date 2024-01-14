import 'package:flutter/material.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:reader/Workflow/Base_URLs.dart';

class Parent_Notices extends StatefulWidget {
  const Parent_Notices(
      {super.key,
      required this.Notice_List,
      required this.Name,
      required this.Adm_no,
      required this.standard,
      required this.section});
  final List<dynamic> Notice_List;
  final String Name;
  final String Adm_no;
  final String standard;
  final String section;

  @override
  State<Parent_Notices> createState() => _Parent_NoticesState();
}

class _Parent_NoticesState extends State<Parent_Notices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          title: const Text("Notices  "),
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
                padding: EdgeInsets.only(left: 24.0,top: 12,bottom: 12),
                child: Row(
                  children: [
                    Text("Notices",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                  ],
                ),
              ),
              Divider(
                color: Colors.tealAccent.shade400,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: widget.Notice_List.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.Notice_List[index][1],style: const TextStyle(fontWeight: FontWeight.w600)),
                            Text(
                                "For Date: ${Formatted_Date(widget.Notice_List[index][5])}",style: const TextStyle(fontWeight: FontWeight.w300),),
                          ],
                        ),
                        trailing: const Icon(Icons.info),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0,left: 10),
                                child: Text("Purpose: ${widget.Notice_List[index][2]}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0,left: 10),
                                child: Text("Description: ${widget.Notice_List[index][3]}",style:const TextStyle(fontWeight: FontWeight.w400,fontSize: 19)),
                              )
                            ],
                          ),
                        ]);
                  })
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
