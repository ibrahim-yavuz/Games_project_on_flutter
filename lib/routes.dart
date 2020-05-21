import 'package:flutter/material.dart';
import 'package:games/game_details.dart';
import 'package:games/main.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case '/':
      return MaterialPageRoute(builder: (context) => Games());
    case '/game_details':
      return MaterialPageRoute(builder: (context) => GameDetails());
    default:
      return MaterialPageRoute(builder: (context) => Games());
  }
}