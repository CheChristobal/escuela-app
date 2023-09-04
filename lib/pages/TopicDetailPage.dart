import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

class TopicDetailsPage extends StatefulWidget {
  final String topicTitle;
  final Map<String, dynamic> topicData;

  TopicDetailsPage({required this.topicTitle, required this.topicData});

  @override
  _TopicDetailsPageState createState() => _TopicDetailsPageState();
}

class _TopicDetailsPageState extends State<TopicDetailsPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio() async {
    String audioPath = 'assets/audios/${widget.topicData["audio"]}';
    int result = await audioPlayer.play(audioPath, isLocal: true);
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future<void> stopAudio() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  void didPopNext() {
    if (isPlaying) {
      stopAudio();
    }
  }

  List<String> shuffleList(List<String> list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var j = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> questionWidgets = widget.topicData.keys.where((key) => key.startsWith("pregunta")).map((key) {
String question = widget.topicData[key]
    .toString()
    .replaceAll('.', '.\n')
    .replaceAll('?', '?\n');      
      // Obtener las alternativas del tema actual
      Map<String, dynamic> alternativesData = widget.topicData["alternativas${key.substring(8)}"];
      String correctAlternative = alternativesData["alternativa1"];
      String respuestaKey = "respuesta${key.substring(8)}"; // Obtiene la respuesta correspondiente a la pregunta
      
      // Obtener la respuesta correspondiente a la pregunta
      String respuesta = widget.topicData[respuestaKey];
      
      // Obtener el texto de las alternativas
      List<String> alternatives = [];
      alternativesData.forEach((key, value) {
        if (key.startsWith("alternativa")) {
          alternatives.add(value);
        }
      });
      
      // Barajar todas las alternativas (incluida la correcta)
      List<String> shuffledAlternatives = shuffleList(alternatives);

      return Column(
        children: [
          ListTile(
            title: Text(
              question,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: shuffledAlternatives.mapIndexed((index, alternative) {
                String letter = String.fromCharCode(65 + index); // Convertir índice a letra A, B, C, D
                return TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        bool isCorrect = alternative == correctAlternative;
                        String feedbackText = isCorrect
                            ? "La respuesta correcta es: \n$respuesta"
                            : "Respuesta incorrecta";

                        return AlertDialog(
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                feedbackText,
                                style: TextStyle(fontSize: 30, color: isCorrect ? Colors.green : Colors.red),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cerrar"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("$letter. $alternative", style: TextStyle(fontSize: 20, color: Colors.black87)),
                );
              }).toList(),
            ),
          ),
        ],
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicTitle),
        backgroundColor: Color.fromARGB(255, 62, 140, 212),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: isPlaying ? stopAudio : playAudio,
              style: ElevatedButton.styleFrom(
                primary: isPlaying ? Colors.red : Colors.green,
              ),
              child: Text(
                isPlaying ? "Detener audio" : "Reproducir audio",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.topicData["titulo"],
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.topicData["texto"]
                  .toString()
                  .replaceAll('. ', '.\n'),
              style: TextStyle(fontSize: 30, color: Colors.black54),
            ),
            SizedBox(height: 16.0),
            Text("Preguntas", style: TextStyle(fontSize: 40)),
            SizedBox(height: 16.0),
            ...questionWidgets,
          ],
        ),
      ),
    );
  }
}

extension ListExtensions<T> on List<T> {
  // Extension method to map with index
  List<R> mapIndexed<R>(R Function(int index, T item) f) {
    var index = 0;
    return map((e) => f(index++, e)).toList();
  }
}
