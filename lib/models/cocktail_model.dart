import 'package:json_annotation/json_annotation.dart';
part 'cocktail_model.g.dart';

@JsonSerializable()
class Cocktail {
  final String idDrink, strDrink, strDrinkThumb;

  Cocktail({required this.idDrink, required this.strDrink, required this.strDrinkThumb});

  factory Cocktail.fromJson(Map<String, dynamic> json) => _$CocktailFromJson(json);
  Map<String, dynamic> toJson() => _$CocktailToJson(this);
}