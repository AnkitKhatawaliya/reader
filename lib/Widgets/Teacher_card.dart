import 'package:flutter/material.dart';

class Teacher_Card extends StatelessWidget {
  const Teacher_Card({
    Key? key,
    required this.url,
    required this.name,
    required this.standard,
    required this.subject,
  }) : super(key: key);

  final String url;
  final String name;
  final String standard;
  final String subject;

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
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.width * 0.15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
                          const Text("Teacher",style: TextStyle(color: Colors.grey),),

                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Primary Class  "),
                          Text("Subject")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(":  $standard"),
                        Text(":  $subject")
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
