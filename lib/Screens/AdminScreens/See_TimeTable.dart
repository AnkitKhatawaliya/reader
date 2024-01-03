import 'package:flutter/material.dart';
import 'package:reader/Widgets/Over_Images.dart';

class See_timeTable extends StatefulWidget {
  const See_timeTable({super.key, required this.timetablelist});
  final List<dynamic> timetablelist;

  @override
  State<See_timeTable> createState() => _See_timeTableState();
}

class _See_timeTableState extends State<See_timeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Icon(
              Icons.admin_panel_settings,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Time Table",
              style: TextStyle(fontSize: 30, color: Colors.white70),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          child: Column(
            children: [
              const Over_Images(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  const Text(
                    "Time Table",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 23),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "Class: ",
                            style: TextStyle(
                              color: Colors.blue, // Color for "Class" label
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            "${widget.timetablelist[0][0]}",
                            style: const TextStyle(
                              color: Colors.green, // Color for Class value
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                          const Text(
                            " || ",
                            style: TextStyle(
                              color: Colors.black, // Color for Class value
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                          const Text(
                            "Section: ",
                            style: TextStyle(
                              color: Colors.blue, // Color for "Section" label
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            "${widget.timetablelist[0][1]}",
                            style: const TextStyle(
                              color: Colors.red, // Color for Section value
                              fontWeight: FontWeight.w600,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Card(
                          color: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Weekday"),
                              Text("Lect 1"),
                              Text("Lect 2"),
                              Text("Lect 3"),
                              Text("Lect 4"),
                              Text("Lect 5"),
                              Text("Lect 6"),
                              Text("Lect 7"),
                              Text("Lect 8"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.3, // Set a fixed height
                        child: ListView.builder(
                          itemCount: widget.timetablelist.length,
                          itemBuilder: (context, index) {
                            var time_table =
                                widget.timetablelist[index] as List<dynamic>;
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Card(
                                      color: Colors.grey.shade300,
                                      margin:
                                          EdgeInsets.only(top: 4, bottom: 4),
                                      child: Center(
                                        child: Text("  ${time_table[2]}  "),
                                      ),
                                    ),
                                    Card(
                                        color: Colors.grey.shade300,
                                        margin:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: Center(
                                            child:
                                                Text("  ${time_table[3]}  "))),
                                    Card(
                                        color: Colors.grey.shade300,
                                        margin:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: Center(
                                            child:
                                                Text("  ${time_table[4]}  "))),
                                    Card(
                                        color: Colors.grey.shade300,
                                        margin:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: Center(
                                            child:
                                                Text("  ${time_table[5]}  "))),
                                    Card(
                                        color: Colors.grey.shade300,
                                        margin:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: Center(
                                            child:
                                                Text("  ${time_table[6]}  "))),
                                    Card(
                                        color: Colors.grey.shade300,
                                        margin:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: Center(
                                            child:
                                                Text("  ${time_table[7]}  "))),
                                    Card(
                                        color: Colors.grey.shade300,
                                        margin:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: Center(
                                            child:
                                                Text("  ${time_table[8]}  "))),
                                    Card(
                                        color: Colors.grey.shade300,
                                        margin:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: Center(
                                            child:
                                                Text("  ${time_table[9]}  "))),
                                    Card(
                                        color: Colors.grey.shade300,
                                        margin:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        child: Center(
                                            child:
                                                Text("  ${time_table[10]}  "))),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
