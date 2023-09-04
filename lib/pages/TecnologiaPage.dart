import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/SubjectPage.dart';
import 'package:escuelaapp/datas/CourseDataTecnologia.dart';

class TecnologiaPage extends StatelessWidget {
  final CourseDataTecnologia _courseDataTecnologia = CourseDataTecnologia();

  @override
  Widget build(BuildContext context) {
    return SubjectPage(
      subject: "Tecnología",
      subjectData: _courseDataTecnologia.courseDataTecnologia["materias"]["Tecnologia"],
    );
  }
}
