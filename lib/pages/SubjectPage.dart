import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/TopicDetailPage.dart';

class SubjectPage extends StatefulWidget {
  final String subject;
  final Map<String, dynamic> subjectData;

  SubjectPage({required this.subject, required this.subjectData});

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  late List<Map<String, dynamic>> filteredTopics;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    filteredTopics = List.from(widget.subjectData.values);
    _searchController = TextEditingController();
    _searchController.addListener(_searchListener);
  }

  void _searchListener() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredTopics = List.from(widget.subjectData.values);
      } else {
        
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: TopicSearchDelegate(widget.subjectData));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purpleAccent, Colors.deepPurple],
          ),
        ),
        child: ListView.builder(
          itemCount: filteredTopics.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> topicData = filteredTopics[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.orange, // Cambiar al color que desees
              child: ListTile(
                title: Text(topicData["titulo"], style: TextStyle(fontSize: 18, color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopicDetailsPage(
                        topicData: topicData,
                        topicTitle: topicData["titulo"],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class TopicSearchDelegate extends SearchDelegate {
  final Map<String, dynamic> subjectData;

  TopicSearchDelegate(this.subjectData);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List filteredResults = subjectData.values.where((topic) {
      final topicTitle = topic['titulo'].toLowerCase();
      return topicTitle.contains(query);
    }).toList();

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> topicData = filteredResults[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.orange, // Cambiar al color que desees
          child: ListTile(
            title: Text(topicData["titulo"], style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopicDetailsPage(
                    topicData: topicData,
                    topicTitle: topicData["titulo"],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // No suggestions in this case
  }
}
