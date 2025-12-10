import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  String buttonTxt;
  void Function() onTap;
  Color? color;
  bool isLoading;
  CustomButton({super.key,required this.buttonTxt, required this.onTap, this.color, this.isLoading=false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 40,right:40),
        height:55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: isLoading?SizedBox(
          height:10,
          width: 10,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
            padding: EdgeInsets.only(left: 120,right: 120,top: 8,bottom: 8),
          ),
        ):Center(child: Text(buttonTxt,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 4,),))


      )
    );
  }
}
