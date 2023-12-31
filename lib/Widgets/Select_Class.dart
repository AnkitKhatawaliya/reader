
import 'package:flutter/material.dart';

String _class = "1";
String _section= "A";

Future<dynamic> Select_Class(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Select Class and Section'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text('Select Class :   ', style: TextStyle(color: Colors.tealAccent.shade700)),
                  DropdownButton<String>(
                    value: _class,
                    icon: const Icon(Icons.list),
                    onChanged: (newValue) {
                      setState(() {
                        _class = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: "1",
                        child: Text("First"),
                      ),
                      DropdownMenuItem<String>(
                        value: "2",
                        child: Text("Second"),
                      ),
                      DropdownMenuItem<String>(
                        value: "3",
                        child: Text("Third"),
                      ),
                      DropdownMenuItem<String>(
                        value: "4",
                        child: Text("Fourth"),
                      ),
                      DropdownMenuItem<String>(
                        value: "5",
                        child: Text("Fifth"),
                      ),
                      DropdownMenuItem<String>(
                        value: "6",
                        child: Text("Sixth"),
                      ),
                      DropdownMenuItem<String>(
                        value: "7",
                        child: Text("Seventh"),
                      ),
                      DropdownMenuItem<String>(
                        value: "8",
                        child: Text("Eighth"),
                      ),
                      DropdownMenuItem<String>(
                        value: "9",
                        child: Text("Nine"),
                      ),
                      DropdownMenuItem<String>(
                        value: "10",
                        child: Text("Ten"),
                      ),
                      DropdownMenuItem<String>(
                        value: "11",
                        child: Text("Eleven"),
                      ),
                      DropdownMenuItem<String>(
                        value: "12",
                        child: Text("Twelve"),
                      )
                    ],
                  )
                ],
              )
,
              Row(
                children: [
                  Text("Select Section :   ", style: TextStyle(color: Colors.tealAccent.shade700)),
                  DropdownButton<String>(
                    value: _section,
                    icon: const Icon(Icons.label),
                    onChanged: (newValue) {
                      setState(() {
                        _section = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: "A",
                        child: Text("A   "),
                      ),
                      DropdownMenuItem<String>(
                        value: "B",
                        child: Text("B  "),
                      ),
                      DropdownMenuItem<String>(
                        value: "C",
                        child: Text("C"),
                      ),
                      DropdownMenuItem<String>(
                        value: "D",
                        child: Text("D"),
                      )
                    ],
                  )

                ],
              ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop({"class": _class, "section": _section, '_cancel': 'true'});
                },
                child: const Text('Cancel', style: TextStyle(color: Colors.red)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop({"class": _class, "section": _section , "_cancel": 'false'});
                },
                child: Text("Okay", style: TextStyle(color: Colors.tealAccent.shade700)),
              ),
            ],
          ),
      );
    },
  );
}