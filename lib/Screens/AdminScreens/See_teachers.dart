import 'package:flutter/material.dart';

class SeeTeachers extends StatefulWidget {
  const SeeTeachers({Key? key, required this.teacherList}) : super(key: key);

  final List<dynamic> teacherList;

  @override
  _SeeTeachersState createState() => _SeeTeachersState();
}

class _SeeTeachersState extends State<SeeTeachers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Teachers'),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: ListView.builder(
        itemCount: widget.teacherList.length,
        itemBuilder: (context, index) {
          var teacher = widget.teacherList[index] as List<dynamic>;
          return Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blueGrey.shade100

            ),
            child: ListTile(
              title: Text(teacher[0]),
              isThreeLine: true,
              subtitle: Text(teacher[5] +
                  "     Class =>  " +
                  teacher[3].toString() +
                  teacher[4]),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
