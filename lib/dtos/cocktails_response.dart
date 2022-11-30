import '../models/cocktail_model.dart';

class CocktailsResponse {
  final List<Cocktail> cocktails;

  CocktailsResponse({ required this.cocktails});

  factory CocktailsResponse.fromJson(Map<String, dynamic> json) =>
      CocktailsResponse(cocktails: (json['drinks'] as List<dynamic>).map((e) => Cocktail.fromJson(e as Map<String, dynamic>)).toList());
}