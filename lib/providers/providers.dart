import 'package:assignment/dtos/category_response.dart';
import 'package:assignment/dtos/cocktails_response.dart';
import 'package:assignment/network/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProviderType{ FAVORITE, CATEGORY }

final currectCategoryProvider = StateProvider((ref) => "");

final favoritesProvider = StateProvider((ref) => []);

final getCocktailsByCategoryProvider = FutureProvider<CocktailsResponse>((ref) {
  return ref.read(apiService).loadCocktailsByCategory(ref.watch(currectCategoryProvider));
});

final getCategoriesProvider = FutureProvider<CategoryResponse>((ref) {
  return ref.read(apiService).loadCategories();
});