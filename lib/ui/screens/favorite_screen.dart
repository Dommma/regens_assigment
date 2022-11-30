import 'package:assignment/providers/providers.dart';
import 'package:assignment/ui/widgets/favorite_screen_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favs = ref.watch(favoritesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FavoriteScreenBodyWidget(),
    );
  }

}