import 'package:flutter/material.dart';
import 'package:social_media_app/components/custom_button.dart';
import 'package:social_media_app/components/custom_text_field1.dart';
class RegistrationPage extends StatefulWidget {
  void Function() onTap;
  RegistrationPage({super.key, required this.onTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 750,
          width: double.infinity,
          color: Colors.red[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_people_outlined,size: 75,color: Colors.red[900],),
              SizedBox(height: 20,),
              Text("Let's Create an Account!",style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              CustomTextField1(hintText: "Email...",isObscure: false,txtController: _emailController,prefixIcon: Icons.email,),
              SizedBox(height: 20,),
              CustomTextField1(hintText: "Password...",isObscure: true,txtController: _passController,prefixIcon: Icons.lock,),
              SizedBox(height: 20,),
              CustomTextField1(hintText: "Confirm Password...",isObscure: true,txtController: _confirmPassController,prefixIcon: Icons.lock,),
              SizedBox(height: 20,),
              CustomButton(buttonTxt: "Register",),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blue[700],
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue[800]
                      ),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
