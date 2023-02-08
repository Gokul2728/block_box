import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: Colors.teal,
        bottom: PreferredSize(
        preferredSize: Size(double.infinity,200),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(filled: true,
                fillColor: Colors.white
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(12.0),
            child: TextFormField(
              
              cursorColor: Colors.teal,
              style: TextStyle(color: Colors.teal),
               decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
             // hoverColor: Colors.teal
              ),
            ),
          ),
        ],
      ),
      ),

      ),
    );
  }
}