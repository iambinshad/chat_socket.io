import 'package:flutter/material.dart';

Widget message(
    {required Map model, required BuildContext context, required myself}) {
  return Container(
      width: MediaQuery.of(context).size.width * 5,
      alignment: myself== true
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: myself == true
                ? const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))
                :const  BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
            color: myself == true?Colors.white:const Color.fromARGB(255, 96, 171, 232)),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(model["message"]),
      ));
}


class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.validator,
    this.suffixIcon,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.prefixIcon,
     this.controller,
    this.keyboardType = TextInputType.text, this.enableSuggestions, this.autocorrect, this.obscureText, this.onTap,
  });
  final int? maxLines;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final void Function()? onTap;
  final Widget? prefixIcon ;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText??false,
      enableSuggestions:enableSuggestions??true,
      autocorrect:autocorrect??true,
      maxLines:maxLines ,
      keyboardType: keyboardType,
      controller: controller,
      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
      validator: validator,
      onTap: onTap,
      decoration: InputDecoration(
        
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 123, 230, 219))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 123, 230, 219))),
        hintText: hintText,
        
        prefixIcon: prefixIcon,
        suffixIcon:suffixIcon ,
        labelText: labelText,
        
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 111, 111, 111),
        ),
      ),
    );
  }
}
