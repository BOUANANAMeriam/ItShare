import 'package:flutter/material.dart';
import 'package:mobileproject/Accueil.dart';
import 'package:mobileproject/Annonces.dart';
import 'package:mobileproject/Profil.dart';
import 'package:mobileproject/chatbot.dart';
import 'package:mobileproject/register.dart';
import 'package:mobileproject/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/profil':(context) => Profil(username: '', email: '' , photo: '',niveau: '',),
        '/home': (context) => Accueil(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/chat': (context) =>  const ChatBot(),
        '/annonce':(context) => CardVilles(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
