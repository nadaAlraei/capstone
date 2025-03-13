import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  TextEditingController textEditingController;
  String? label;
  bool obscureText;
  String? errorText;
  String? hintText;
  Widget? prefixIcon;
  int? maxLines;
  TextInputType? keyboardType;
  Widget? suffixIcon;

  InputWidget({
    super.key,
    required this.textEditingController,
    required this.obscureText,
     this.prefixIcon,
     this.label,
    this.suffixIcon,
    this.maxLines = 1,
    this.keyboardType,
    this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.83,

        child: TextField(
          obscureText: obscureText,
          controller: textEditingController,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color.fromARGB(82, 237, 241, 243),
                width: 1,
              ),
            ),

            errorText: errorText,
          ),
        ),
      ),
    );
  }
}