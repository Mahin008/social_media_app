import 'package:flutter/material.dart';
import 'package:social_media_app/pages/login_page.dart';
import 'package:social_media_app/pages/registration_page.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage=true;
  onTap()
  {
    setState(() {
      showLoginPage= !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: onTap,);
    }
    else{
      return RegistrationPage(onTap: onTap);
    }
  }
}
