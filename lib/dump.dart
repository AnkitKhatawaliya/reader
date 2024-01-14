// import 'package:flutter/material.dart';
// import 'package:reader/Widgets/Over_Images.dart';
// import 'package:reader/Workflow/Base_URLs.dart';
//
// class Parent_Marks extends StatefulWidget {
//   const Parent_Marks({super.key, required this.Marks_records, required this.Name, required this.Adm_no, required this.standard, required this.section});
//   final List<dynamic> Marks_records;
//   final String Name;
//   final String Adm_no;
//   final String standard;
//   final String section;
//
//   @override
//   State<Parent_Marks> createState() => _Parent_MarksState();
// }
//
// class _Parent_MarksState extends State<Parent_Marks> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.tealAccent.shade700,
//           title: const Text("Marks Records"),
//         ),
//         body:  Column(
//           children: [
//             Student_Card(context),
//             Divider(
//               color: Colors.tealAccent.shade400,
//             ),
//           ],
//         )
//     );
//   }
//   Stack Student_Card(BuildContext context) {
//     return Stack(
//       children: [
//         const Over_Images(),
//         Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.4,
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.1,
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.55,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.Name,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 28),
//                       ),
//                       const Text(
//                         "Student",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.01,
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.30,
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text("Adm NO"),
//                                 Text(": ${widget.Adm_no}"),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text("Class"),
//                                 Text(
//                                     ": ${widget.standard}  ${widget.section} "),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Positioned(
//           top: MediaQuery.of(context).size.height * 0.36,
//           left: MediaQuery.of(context).size.width * 0.65,
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.32,
//             child: Image.network(
//               "$Client_Base_url/Image/${widget.Adm_no}",
//               width: double.maxFinite,
//               loadingBuilder: (BuildContext context, Widget child,
//                   ImageChunkEvent? loadingProgress) {
//                 if (loadingProgress == null) {
//                   return child;
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                           (loadingProgress.expectedTotalBytes ?? 1)
//                           : null,
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
// }
//
