import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  String buttonTxt;
  CustomButton({super.key,required this.buttonTxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40,right:40),
      height:55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red[900],
      ),
      child: Center(child: Text(buttonTxt,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 4),)),
    );
  }
}
