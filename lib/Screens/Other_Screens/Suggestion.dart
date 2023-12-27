import 'package:flutter/material.dart';

class SuggestionScreen extends StatefulWidget {
  SuggestionScreen({Key? key}) : super(key: key);

  @override
  _SuggestionScreenState createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  TextEditingController suggestionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Want to Make any Suggestion ",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "to the admin ??",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Show a SnackBar message when the info icon is clicked.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Keep your suggestions respectful.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.info,
                        size: MediaQuery.of(context).size.width * 0.07,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                Text("Feel free to write whatever you feel",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04)),
                TextField(
                  controller: suggestionController,
                  decoration: InputDecoration(
                    hintText: 'Drop Your suggestion here',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 36,
              child: ElevatedButton(
                onPressed: () {

                  String suggestionText = suggestionController.text.trim();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(suggestionText),
                        duration: Duration(seconds: 3),
                      ),
                    );

                },
                child: Text("Send to School Administration"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
