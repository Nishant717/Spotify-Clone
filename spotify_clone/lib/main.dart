import 'package:flutter/material.dart';
import 'package:spotify_clone/screen/songpage.dart';
import 'screen/homepage.dart'; 
// ignore: duplicate_import
import 'screen/songpage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      
      initialRoute: '/home',
      routes: {
        "/home":(context) => const Homepage(),
        "/song" : (context) => const SongPage()
      },
    );
  }
}