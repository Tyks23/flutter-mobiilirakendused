import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rühm 2',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const RandomWord(title: 'Rühm 2, Flutter'),
    );
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RandomWord> createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  String wordPair = WordPair.random().asPascalCase;

  void _newRandomWord() {
    setState(() {
      wordPair = WordPair.random().asPascalCase;
    });
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Color.fromARGB(255, 255, 255, 255),
    backgroundColor: Colors.red[500],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              wordPair,
              style: const TextStyle(fontSize: 20.0),
            ),
            TextButton(
              style: flatButtonStyle,
              onPressed: _newRandomWord,
              child: const Text(
                'Random word',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
