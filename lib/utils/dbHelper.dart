import 'dart:convert';

import 'package:apiTask/model/apiListDataModel.dart';
import 'package:apiTask/model/apiListModel.dart';
import 'package:http/http.dart' as http;

class DbHelper {
  Future<List<ApiListDataModel>> getUserData(int page) async {
    List<ApiListDataModel> apiListDataModel = [];
    ApiListModel apiListModel;
    final perPage = 5;
    final url =
        Uri.parse("https://reqres.in/api/users?page=$page&per_page=$perPage");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        apiListModel = ApiListModel.fromJson(data);
        apiListDataModel.addAll(apiListModel.apiListDataModel);
      }
    } catch (e) {
      print(e);
    }
    return apiListDataModel;
  }
}
