import 'dart:convert';

import '../model/food.dart';
import 'package:http/http.dart' as http;

abstract class FoodRepository {
  Future<List<Recipe>> getFoods();
}

class FoodRepositoryImpl extends FoodRepository {
  @override
  Future<List<Recipe>> getFoods() async {
     final url = (Uri.parse(
        'https://forkify-api.herokuapp.com/api/search?q=pizza#'));
    var response =
        await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Recipe> recipes = Food.fromJson(data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
  }
}
