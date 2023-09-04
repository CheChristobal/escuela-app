import 'package:flutter/material.dart';
import 'package:escuelaapp/pages/TopicDetailPage.dart';

class TopicSearchDelegate extends SearchDelegate {
  final Map<String, dynamic> subjectData;
  final Function(Map<String, dynamic>) conditions;

  TopicSearchDelegate(this.subjectData, this.conditions);

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
      return topicTitle.contains(query.toLowerCase()) && conditions(topic);
    }).toList();

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> topicData = filteredResults[index];
        return ListTile(
          title: Text(topicData["titulo"], style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicDetailsPage(
                  topicData: topicData,
                  topicTitle: '',
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // No suggestions in this case
  }
}
