import 'package:flutter/material.dart';

class Login_type extends StatelessWidget {
  final IconData icon;
  final String show_text;
  final VoidCallback onTap;
  const Login_type({super.key, required this.icon, required this.show_text,    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minWidth:
              MediaQuery.of(context).size.width * 0.5,
          minHeight:
              MediaQuery.of(context).size.height * 0.11, // set your minimum height
        ),
        child: Card(
          elevation: 0,
          color: Colors.grey.shade300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(
                  width: 10,
                ),
                Text(show_text)
              ],
            ),
        ),
      ),
    );
  }
}
