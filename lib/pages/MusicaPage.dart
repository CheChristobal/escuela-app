import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/SubjectPage.dart';

import '../datas/CourseDataMusica.dart';

class MusicaPage extends StatelessWidget {
  final CourseDataMusica _courseDataMusica = CourseDataMusica();
  

  @override
  Widget build(BuildContext context) {
    return SubjectPage(
      subject: "Musica",
      subjectData: _courseDataMusica.courseDataMusica["materias"]["Musica"],
    );
  }
}
