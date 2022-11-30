import 'package:assignment/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class FilterDialogWidget extends ConsumerWidget {
  List<String> categories;

  FilterDialogWidget({required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(title: const Center(child: Text("Select category")), children: [
      Padding(
        padding: const EdgeInsets.only(left:20, right:20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
              border: Border.all(color: Colors.black, width:2), //border of dropdown button
              borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
              boxShadow: const <BoxShadow>[ //apply shadow on Dropdown button
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                    blurRadius: 5) //blur radius of shadow
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:20, right:20),
            child: DropdownButton(
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white,),
              dropdownColor: Theme.of(context).primaryColor,
              style: CustomTextStyle.dropDownFont,
                value: ref.watch(currectCategoryProvider).isNotEmpty
                    ? ref.watch(currectCategoryProvider)
                    : null,
                items: categories
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (dynamic newValue) {
                  ref.read(currectCategoryProvider.notifier).state = newValue;
                  Navigator.pop(context);
                }),
          ),
        ),
      ),
    ]);
  }
}
