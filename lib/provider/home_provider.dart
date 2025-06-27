
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../custom/endpoint.dart';
import '../custom/http_parse.dart';

class HomeProvider extends ChangeNotifier{

  List<dynamic> _discountList = [];
  String _from = '';
  String _to = '';
  String _startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String _returnDate = '';

  Future<void> getDiscount(BuildContext context) async {
    _discountList = [];
    notifyListeners();

    try {
      Response response = await HttpParse().get(
        Endpoint.discount,
      );

      final result = response.data;

      if (result['success']) {
        _discountList = result['data'];
        notifyListeners();
      }
    } catch (e) {
      print("Failed to load discount: $e");
    }
  }

  Future<void> addSelection(String value,String key) async {
      switch(key){
        case 'from':
          _from = value;
          break;
        case 'to':
          _to = value;
          break;
        case 'start':
          _startDate = value;
          break;
        case 'return':
          _returnDate = value;
          break;
      }
      notifyListeners();
  }

  Future<void> removeSelections(String key) async {
    switch(key){
      case 'from':
        _from = '';
        break;
      case 'to':
        _to = '';
        break;
      case 'start':
        _startDate = '';
        break;
      case 'return':
        _returnDate = '';
        break;
    }
    notifyListeners();
  }

  Future<void> searchTicket(
      String departureDate,
      String returnDate,
      String from,
      String destination
  ) async{
    Response response = await HttpParse().get(
      Endpoint.searchTickets,
      {
        'departureDate' : departureDate,
        'returnDate' : returnDate,
        'from' : from,
        'destination' : (destination.isEmpty) ? '': destination
      }
    );

    print(response);


  }

  List<dynamic> get discountList => _discountList;
  String get from => _from;
  String get to => _to;
  String get startDate => _startDate;
  String get returnDate => _returnDate;
}















