import 'package:assignment/ui/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBoxWidget extends StatelessWidget {
  String message;
  MessageBoxWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            padding: const EdgeInsets.all(10),
            child: Text(message, style: CustomTextStyle.messageBoxFont,),
          )

      )
    );
  }

}