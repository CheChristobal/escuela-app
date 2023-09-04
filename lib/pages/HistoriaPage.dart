import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/SubjectPage.dart';
import 'package:escuelaapp/datas/CourseDataHistoria.dart';

class HistoriaPage extends StatelessWidget {
  final CourseDataHistoria _courseDataHistoria = CourseDataHistoria();

  @override
  Widget build(BuildContext context) {
    return SubjectPage(
      subject: "Historia",
      subjectData: _courseDataHistoria.courseDataHistoria["materias"]["Historia"],
      
    );
  }
}
