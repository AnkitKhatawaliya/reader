import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reader/Screens/TeacherScreens/teach_add_notice.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:reader/Widgets/Select_Class.dart';

class See_Notices_teacher extends StatefulWidget {
  const See_Notices_teacher(
      {super.key,
      required this.noticelist,
      required this.Standard,
      required this.ID});
  final List<dynamic> noticelist;
  final int Standard;
  final String ID;

  @override
  State<See_Notices_teacher> createState() => _See_Notices_teacherState();
}

class _See_Notices_teacherState extends State<See_Notices_teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "Notices",
              style: TextStyle(fontSize: 30, color: Colors.white70),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Over_Images(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text(
                  "Notices",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 23),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Map<String, String> selectedValues =
                        await Select_Class(context);
                    if (selectedValues["_cancel"] == "false") {
                      String section = selectedValues["section"] ?? "A";
                      int? standard =
                          int.tryParse(selectedValues["class"] ?? "1");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tech_add_notice(
                                    Standard: standard ?? widget.Standard,
                                    Section: section,
                                    ID: widget.ID,
                                  )));
                    }
                  },
                  child: const Text(
                    "Add a Notice",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.5, // Adjust the height as needed
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Card(
                      color: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .18,
                              child: const Center(child: Text("Sr. NO"))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .3,
                              child: const Center(child: Text("For Date"))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .3,
                              child: const Center(child: Text("Title  "))),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.noticelist.length,
                        itemBuilder: (context, index) {
                          var notice =
                              widget.noticelist[index] as List<dynamic>;
                          DateTime originalDate = DateTime.parse(notice[5]);
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(originalDate);
                          return ExpansionTile(
                            trailing: const Icon(Icons
                                .info), // This will make the button invisible
                            backgroundColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            title: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .1,
                                      child: Center(
                                          child: Text("${index + 1}  "))),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child:
                                          Center(child: Text(formattedDate))),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      child: Center(
                                          child: Text("${notice[1]}  "))),
                                ],
                              ),
                            ),
                            children: [
                              Card(
                                color: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "  Subject:  ${notice[2]}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "  Added Date:  ${notice[4]}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "  Receivers:  ${notice[6]}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .90,
                                          child: Text(
                                            "Desc:  ${notice[3]}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
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
  }
}
