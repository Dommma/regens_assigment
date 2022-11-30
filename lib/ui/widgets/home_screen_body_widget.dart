import 'package:assignment/providers/providers.dart';
import 'package:assignment/ui/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenBodyWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(currectCategoryProvider);
    if(category=="") {
      return Text("Select category");
    } else {
      final cocktails = ref.watch(getCocktailsByCategoryProvider);
      return cocktails.when(
          data: (data) => ListView.builder(
            itemCount: data.cocktails.length,
            itemBuilder: (context, int index) => ItemWidget(index: index, providerType: ProviderType.CATEGORY,),
          ),
          error: (err, _) => Text(err.toString()),
          loading: () => const Center(
              child: CircularProgressIndicator()));
    }
  }

}