
import 'package:escuelaapp/datas/CourseDataMatematicas.dart';
import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/SubjectPage.dart';

class MatematicasPage extends StatelessWidget {
  final CourseDataMatematicas _courseDataMatematicas = CourseDataMatematicas();

  @override
  Widget build(BuildContext context) {
    return SubjectPage(
      subject: "Matematicas",
      subjectData: _courseDataMatematicas.courseDataMatematicas["materias"]["Matematicas"],
    );
  }
}

