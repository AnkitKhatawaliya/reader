import 'package:flutter/material.dart';

class tech_See_Marks extends StatefulWidget {
  const tech_See_Marks({super.key, required this.Marks_List});
  final List<dynamic> Marks_List;


  @override
  State<tech_See_Marks> createState() => _tech_See_MarksState();
}

class _tech_See_MarksState extends State<tech_See_Marks> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> Names = widget.Marks_List[0];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text(" Marks records"),
      ),
      body: ListView.builder(
        itemCount: widget.Marks_List.length-1,
        reverse: true,
        itemBuilder: (context, index) {
          List<dynamic> record = widget.Marks_List[index+1];
          String date = record[0];
          List<String> dateParts = date.split('-');

          String year = dateParts[0];
          String month = dateParts[1];
          String day = dateParts[2];

          String formatted_date = "$day-$month-$year";

          String Max_marks = record[1].split('_')[1];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Date: $formatted_date         Max Marks = $Max_marks',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Names.length-2,
                    itemBuilder: (context, innerIndex) {
                      return ListTile(
                        title: Text(Names[innerIndex+2]),
                        subtitle: Text('Marks: ${record[innerIndex + 2]}'),
                      );
                    },
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
