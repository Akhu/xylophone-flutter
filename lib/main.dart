import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playNote(int noteNumber){
    final audioPlayer = AudioCache();
    audioPlayer.play('note$noteNumber.wav');
  }

  Widget buildKey({int soundNumber, Color color}){
    return FlatButton(onPressed: () {
      playNote(soundNumber);
    },
      color: color,
      child: Text(""),
    );
  }

  List<Widget> buildKeys() {
    return List.generate(7, (int index) {
      return Expanded(
        child: buildKey(soundNumber: index, color: Colors.blue[index*100])
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildKeys(), direction: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
