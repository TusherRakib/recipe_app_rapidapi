import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:recipe_app_rapidapi/models/recipe_list_model.dart';

class ApiMethods {
  Future<RecipeListModel?> fetchRecipes() async {
    RecipeListModel recipeListModel = RecipeListModel();
    final url = Uri.https(
      'edamam-recipe-search.p.rapidapi.com',
      '/api/recipes/v2',
      {
        'type': 'public',
        'q': 'chicken',
        'beta': 'true',
      },
    );

    final headers = {
      'Accept-Language': 'en',
      'X-RapidAPI-Key': 'f4fdc428c7mshae6bd49f3e201f6p17c4ffjsn4ee6e8c0fdcb',
      'X-RapidAPI-Host': 'edamam-recipe-search.p.rapidapi.com',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);
        recipeListModel = RecipeListModel.fromJson(jsonMap);
        log(recipeListModel.toJson().toString());
        return recipeListModel;
      } else {
        log('API call returned: ${response.statusCode} ${response.reasonPhrase}');
        return null;
      }
    } catch (error) {
      log(error.toString());
    }
    return null;
  }
}
