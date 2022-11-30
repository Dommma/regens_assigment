import 'package:assignment/providers/providers.dart';
import 'package:assignment/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/cocktail_model.dart';

class ItemWidget extends ConsumerWidget {
  int index;
  ProviderType providerType;
  ItemWidget({required this.index, required this.providerType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favs = ref.watch(favoritesProvider);
    var cocktail = providerType==ProviderType.CATEGORY ? ref.read(getCocktailsByCategoryProvider).value!.cocktails[index] : ref.read(favoritesProvider)[index];
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00000000),
                  Color(0xCC000000),
                ],
              ),
            ),
            child: Image.network(cocktail.strDrinkThumb,
                fit: BoxFit.cover),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  cocktail.strDrink,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.itemWidgetFont,
                ),
              ),
              IconButton(
                  onPressed: () {
                    List oldState = favs;
                    if(checkFavoriteContains(favs, cocktail)) {
                      oldState.remove(cocktail);
                    } else {
                      oldState.add(cocktail);
                    }
                    ref.read(favoritesProvider.notifier).state = oldState.toList();
                  },
                  icon: Icon(Icons.favorite, size: 30, color: checkFavoriteContains(favs, cocktail)? Colors.red : const Color(0xFFFFFFFF),)
              )
            ],
          ),
        )
      ],
    );
  }
  bool checkFavoriteContains(List<dynamic> list, Cocktail cocktail) {
    for(Cocktail c in list) {
      if (cocktail.idDrink == c.idDrink) {
        return true;
      }
    }
    return false;
  }

}