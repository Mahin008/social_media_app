import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth_gate.dart';
import 'package:social_media_app/pages/login_or_register.dart';
import 'package:social_media_app/pages/login_page.dart';
import 'package:social_media_app/pages/registration_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthGate(),
  ));
}

