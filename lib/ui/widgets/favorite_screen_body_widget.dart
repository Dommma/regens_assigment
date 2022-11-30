import 'package:assignment/providers/providers.dart';
import 'package:assignment/ui/widgets/item_widget.dart';
import 'package:assignment/ui/widgets/message_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreenBodyWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favs = ref.watch(favoritesProvider);
    if(favs.isEmpty) {
      return MessageBoxWidget(message: "Favorite list is empty!");
    } else {
      return ListView.builder(
            itemCount: favs.length,
            itemBuilder: (context, int index) => ItemWidget(index: index, providerType: ProviderType.FAVORITE),
          );
    }
  }

}