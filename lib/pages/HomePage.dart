import 'package:flutter/material.dart';
import 'HistoriaPage.dart';
import 'CienciasNaturalesPage.dart';
import 'LenguajePage.dart';
import 'InglesPage.dart';
import 'TecnologiaPage.dart';
import 'MatematicasPage.dart';
import 'MusicaPage.dart'; // Importa la página de Música

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Historia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Ciencias Naturales',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Lenguaje',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Inglés',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Tecnología',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Matemáticas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note), // Ícono de Música
            label: 'Música', // Etiqueta de Música
          ),
        ],
      ),
    );
  }

  late final List<Widget> _pages = [
    HistoriaPage(),
    CienciasNaturalesPage(),
    LenguajePage(),
    InglesPage(),
    TecnologiaPage(),
    MatematicasPage(),
    MusicaPage(),   
  ];
}
