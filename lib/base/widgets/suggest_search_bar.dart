import 'package:GoTravel/data_storage/place_api.dart';
import 'package:GoTravel/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/search_suggest.dart';

class SearchBar extends StatefulWidget {
  final String searchHint;
  final String searchKey;
  const SearchBar({super.key, required this.searchHint, required this.searchKey});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _selectedValue = '';
  List<String> _searchHistory = [];

  void _handleSearchSelection(String selectedValue) {
    setState(() {
      _selectedValue = selectedValue;
      _searchHistory.add(selectedValue);
    });
    _processSelectedValue(context,selectedValue);
  }

  void _processSelectedValue(BuildContext context,String value) async{
    final provider = Provider.of<HomeProvider>(context,listen: false);

    if(value != ''){
      await provider.addSelection(value,widget.searchKey);
      if(context.mounted){
        context.go('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchHint),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchSuggest(
                    _handleSearchSelection,
                    searchTerms: searchTerms,
                    hint: widget.searchHint
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(_selectedValue),
      ),
    );
  }
}