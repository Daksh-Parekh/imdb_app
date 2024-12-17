import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:imdb_app/screens/home_page/model/home_model.dart';

class ApiHelper {
  Future<DataModel?> getImdbApi(String? search) async {
    log('API Calling Start');
    String link = "https://imdb-com.p.rapidapi.com/search?searchTerm=$search?";

    http.Response response = await http.get(Uri.parse(link), headers: {
      "x-rapidapi-host": "imdb-com.p.rapidapi.com",
      "x-rapidapi-key": "7fdba83299mshb0c0b4b0f829e9ep103e25jsn6950abcd98cf",
    });

    // log('${response.statusCode}');
    if (response.statusCode == 200) {
      // log('$response');
      var json = jsonDecode(response.body);
      // log('$json');
      DataModel modes = DataModel.mapToModel(json);
      log('${modes}');
      return modes;
    }
    return null;
  }
}
