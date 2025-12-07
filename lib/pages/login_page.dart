import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth_services.dart';
import 'package:social_media_app/components/custom_button.dart';
import 'package:social_media_app/components/custom_text_field1.dart';
class LoginPage extends StatefulWidget {
  void Function() onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();
  Future<void> login(BuildContext context)async{
    try{
      AuthServices _authServices = AuthServices();
      await _authServices.signInWithEmailAndPass(_emailController.text, _passController.text);
    } on FirebaseAuthException catch(e){
      showDialog(
          context: context,
          builder: (context)=>AlertDialog(title: Text(e.toString()),)

      );
    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_people_outlined,size: 75,color: Colors.red[900],),
              SizedBox(height: 20,),
              Text("Hello! Welcome to Social Media App",style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              CustomTextField1(hintText: "Email...",isObscure: false,txtController: _emailController,prefixIcon: Icons.email,),
              SizedBox(height: 20,),
              CustomTextField1(hintText: "Password...",isObscure: true,txtController: _passController,prefixIcon: Icons.lock,),
              SizedBox(height: 20,),
              CustomButton(buttonTxt: "Login",onTap: ()=>login(context),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register",
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
