import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/SubjectPage.dart';
import 'package:escuelaapp/datas/CourseDataCienciasNaturales.dart';

class CienciasNaturalesPage extends StatelessWidget {
  final CourseDataCienciasNaturales _courseDataCienciasNaturales = CourseDataCienciasNaturales();

  @override
  Widget build(BuildContext context) {
    return SubjectPage(
      subject: "Ciencias Naturales",
      subjectData: _courseDataCienciasNaturales.courseDataCienciasNaturales["materias"]["Ciencias Naturales"],
    );
  }
}
