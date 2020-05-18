import 'package:flutter/material.dart';
import 'character_listing_screen.dart';

void main() {
  runApp(new MaterialApp(
    title: "Despicable Me Characters",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.white
        )
    ),
    home: new CharacterListingScreen(),
  ));
}



