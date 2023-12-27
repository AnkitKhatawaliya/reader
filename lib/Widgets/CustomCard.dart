import 'package:flutter/material.dart';

class CustomCardViewone extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color textcolor;
  final VoidCallback onTap;
  final Color iconcolor;

  const CustomCardViewone({super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.textcolor,
    required this.iconcolor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.12,
        child: Card(
          color: Colors.cyan.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: AspectRatio(
            aspectRatio: 4 / 1,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(icon, size: 40,color: iconcolor),
                ),
                const VerticalDivider(color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: textcolor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}