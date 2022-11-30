import 'package:assignment/dtos/category_response.dart';
import 'package:assignment/providers/providers.dart';
import 'package:assignment/ui/screens/favorite_screen.dart';
import 'package:assignment/ui/styles/text_styles.dart';
import 'package:assignment/ui/widgets/home_screen_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/dialog_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cats = ref.watch(getCategoriesProvider);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Cocktail list'),
            actions: [
              IconButton(
                  onPressed: () {
                    cats.when(
                        data: (data) {
                          showDialog(
                              context: context,
                              builder: (context) => FilterDialogWidget(categories: data.categories,)
                          );
                          },
                        error: (error, _) {},
                        loading: () {});
                  },
                  icon: const Icon(Icons.filter_alt_outlined)),
              badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: badges.BadgeAnimationType.slide,
                  badgeContent: Text(ref.watch(favoritesProvider).length.toString(), style: CustomTextStyle.badgeFont,),
                  child: IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FavoriteScreen()));
                      },
                      icon: const Icon(Icons.favorite))
              ),
            ],
        ),
        body: HomeScreenBodyWidget(),
    );
  }

}
