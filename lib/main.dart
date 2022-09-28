import 'package:fire_sql_mycontectbook/spleshscrren.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );

  runApp(MaterialApp(title: "Contect Book",home: SplashScreen1(),
    debugShowCheckedModeBanner: false,));

}