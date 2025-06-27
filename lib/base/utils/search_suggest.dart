import 'package:flutter/material.dart';

class SearchSuggest extends SearchDelegate<String> {
  final String hint;
  final List searchTerms;
  final Function(String) onValueSelected;
  SearchSuggest(this.onValueSelected, {required this.hint, required this.searchTerms});

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app bar (clear button)
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = searchTerms
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            onValueSelected(results[index]);
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions as user types
    final suggestions = query.isEmpty
        ? searchTerms.take(5).toList()
        : searchTerms
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .take(5)
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.search),
          title: RichText(
            text: TextSpan(
              text: suggestions[index].substring(0, query.length),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestions[index].substring(query.length),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            query = suggestions[index];
            onValueSelected(suggestions[index]);
            showResults(context);
          },
        );
      },
    );
  }
}