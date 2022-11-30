import 'dart:convert';

import 'package:assignment/dtos/category_response.dart';
import 'package:assignment/dtos/cocktails_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class APIService {
  String categoryPath = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list";
  String filterByCategoryPath =
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c="; //+category name

  Future<CocktailsResponse> loadCocktailsByCategory(String categoryName) async {
    Response response =
        await get(Uri.parse(filterByCategoryPath + categoryName));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, Object?>;
      return CocktailsResponse.fromJson(body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<CategoryResponse> loadCategories() async {
    Response response = await get(Uri.parse(categoryPath));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, Object?>;
      return CategoryResponse.fromJson(body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiService = Provider<APIService>((ref) => APIService());
