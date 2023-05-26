import 'package:flutter/material.dart';

Widget messageTile(
    {required String text, required BuildContext context, required myself}) {
  return Container(
      width: MediaQuery.of(context).size.width * 5,
      alignment: myself == false ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: myself == false
                ? const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))
                : const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
            color: myself == false
                ? Colors.white
                : const Color.fromARGB(255, 96, 171, 232)),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(text),
      ));
}
