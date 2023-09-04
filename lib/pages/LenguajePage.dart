import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/SubjectPage.dart';
import 'package:escuelaapp/datas/CourseDataLenguaje.dart';

class LenguajePage extends StatelessWidget {
  final CourseDataLenguaje _courseDataLenguaje = CourseDataLenguaje();

  @override
  Widget build(BuildContext context) {
    return SubjectPage(
      subject: "Lenguaje",
      subjectData: _courseDataLenguaje.courseDataLenguaje["materias"]["Lenguaje"],
    );
  }
}
