import 'package:flutter/material.dart';
import 'package:reader/Screens/AdminScreens/Add_notices.dart';
import 'package:reader/Widgets/Over_Images.dart';

class See_notices extends StatefulWidget {
  const See_notices({super.key, required this.noticelist});
  final List<dynamic> noticelist;

  @override
  State<See_notices> createState() => _See_noticesState();
}

class _See_noticesState extends State<See_notices> {
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
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Add_notice()));
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5, // Adjust the height as needed
                width: MediaQuery.of(context).size.width * 2,
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
                            Text("Sr. NO"),
                            Text("For Date"),
                            Text("Title"),
                            Text("Heading"),
                            Text("Added Date"),
                            Text("Receivers"),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.noticelist.length,
                      itemBuilder: (context, index) {
                        var time_table =
                        widget.noticelist[index] as List<dynamic>;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Card(
                            color: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("  ${index+1}        "),
                                Text("${time_table[5]}"),
                                Text("${time_table[1]}  "),
                                Text("${time_table[2]}  "),
                                Text("${time_table[4]}      "),
                                Text("${time_table[6]}      "),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
