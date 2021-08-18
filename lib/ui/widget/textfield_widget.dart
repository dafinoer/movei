import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? title;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool? enable;
  final TextEditingController? controller;
  final TextInputType? type;
  final Function()? onTap;
  final bool? isDance;
  final int? maxLine;
  final Widget? suffixIcon;


  const TextFieldWidget({
    Key? key,
    this.title,
    this.hintText,
    this.validator,
    this.enable,
    this.controller,
    this.type,
    this.onTap,
    this.suffixIcon,
    this.isDance = false,
    this.maxLine = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        isDense: isDance,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        errorBorder:OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red)
        ),
        focusedErrorBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)
        ),
        suffixIcon: suffixIcon
      ),
      maxLines: maxLine,
      validator: validator,
      enabled: enable,
      keyboardType: type,
      onTap: onTap,
    );
  }
}
