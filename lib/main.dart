import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jembatan/isi/isi.dart';
import 'package:jembatan/isi/isiope.dart';
import 'package:jembatan/pages/homepage.dart';
import 'package:jembatan/pages/login.dart';
import 'package:jembatan/pages/operator.dart';
import 'package:jembatan/pages/profil.dart';
import 'pages/tambahlaporan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build (BuildContext context){
    return MaterialApp(
      title: "jembatan",

      initialRoute: "/",
      routes: {
        "/" : ((context) => Homepage()),
        // "/user" : (context) => userpage(),
        // "/user_detail" : (context) => userdetail(),
        "/login" : (context) => login(),
        "/operator": (context) => operatorpage(), // Gunakan operatorName dari arguments
        // "/operatordetail" : (context) => operatordetail(),
         "/tambahlaporan" : (context) => Tambahlaporan(),
         "/isi" : (context) => isi(),
         "/profil": (context) => profil(),
         "/isiop" : (context) => isiop(),
      },
      
    );

  }
}