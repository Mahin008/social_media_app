import 'package:flutter/material.dart';
class CustomTextField1 extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  IconData prefixIcon;
  TextEditingController txtController= TextEditingController();
  CustomTextField1({super.key,required this.hintText, required this.isObscure, required this.txtController, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),

      child: TextField(
          controller: txtController,
          obscureText: isObscure,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,),
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

      ),
    );
  }
}
