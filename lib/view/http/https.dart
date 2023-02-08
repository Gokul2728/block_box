import 'package:flutter/material.dart';
//import 'package:flutter_tts/flutter_tts.dart';

//enum TtsState { playing, stopped, paused, continued }

void main() {
  runApp(const MyAppp());
}

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Http(),
    );
  }
}

class Http extends StatefulWidget {
  const Http({super.key});

  @override
  State<Http> createState() => _HttpState();
}

class _HttpState extends State<Http> {
  final TextEditingController controller = TextEditingController();
  // FlutterTts flutterTts = FlutterTts();

  _speak(String text) async {
    // await flutterTts.setLanguage("en-US");
    // await flutterTts.setPitch(0.8);
    // await flutterTts.speak(text);
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http"),
        backgroundColor: Colors.green.shade300,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: TextField(
              controller: controller,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                label: const Text("Enter Number"),
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                fillColor: Colors.green.shade100,
                filled: true,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size(130, 40),
              elevation: 7,
            ),
            onPressed: _speak(controller.text),
            child: const Text(
              "Click",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
