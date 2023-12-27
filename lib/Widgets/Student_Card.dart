import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    Key? key,
    required this.url,
    required this.name,
    required this.roll_no,
    required this.standard,
    required this.attendance,
  }) : super(key: key);

  final String url;
  final String name;
  final String roll_no;
  final String standard;
  final String attendance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child:
                CircleAvatar(
                  radius: 80,
                  child: Image.network(
                    url,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.width * 0.135,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
                          Text("Student",style: TextStyle(color: Colors.grey),),

                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Class  "),
                          Text("Roll no"),
                          Text("Attendance"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(":  "+standard),
                          Text(":  "+roll_no),
                          Text(":  "+attendance),
                        ],)

                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
