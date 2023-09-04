import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/SubjectPage.dart';
import 'package:escuelaapp/datas/CourseDataIngles.dart';

class InglesPage extends StatelessWidget {
  final CourseDataIngles _courseDataIngles = CourseDataIngles();

  @override
  Widget build(BuildContext context) {
    return SubjectPage(
      subject: "Inglés",
      subjectData: _courseDataIngles.courseDataIngles["materias"]["Ingles"],
    );
  }
}
