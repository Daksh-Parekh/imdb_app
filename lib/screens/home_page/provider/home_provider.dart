import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:imdb_app/helper/api_helper.dart';
import 'package:imdb_app/screens/home_page/model/home_model.dart';

class HomeProvider with ChangeNotifier {
  List<Edges> edgesList = [];
  DataModel? dataModel = DataModel();

  void APICalling(String? search) async {
    ApiHelper helper = ApiHelper();
    log('open');
    dataModel = await helper.getImdbApi(search);
    edgesList = dataModel?.dataMainSearch?.mainModels?.edge ?? [];
    log('${edgesList}');
    notifyListeners();
  }
}
  // List<WeatherListModel> weatherList = [];
  // WeatherDataModel? weatherModel = WeatherDataModel();
  
  //   weatherList = weatherModel?.weathers ?? [];