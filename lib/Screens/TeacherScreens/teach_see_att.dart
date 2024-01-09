import 'package:flutter/material.dart';

class Teac_see_att extends StatefulWidget {
  const Teac_see_att({Key? key, required this.Att_rec}) : super(key: key);
  final List<dynamic> Att_rec;

  @override
  State<Teac_see_att> createState() => _Teac_see_attState();
}

class _Teac_see_attState extends State<Teac_see_att> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> Names = widget.Att_rec[0];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text(" Attendance records"),
      ),
      body: ListView.builder(
        itemCount: widget.Att_rec.length-1,
        reverse: true,
        itemBuilder: (context, index) {
          List<dynamic> record = widget.Att_rec[index+1];
          String date = record[0];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Date: $date',
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
                        subtitle: Text('Status: ${record[innerIndex + 2]}'),
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
