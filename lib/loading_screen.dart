import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';
import 'contraints.dart';
import 'custom_listview_elements.dart';

List<CustomElement> custom_elements = [];

Future<String> getResponse(String url) async{
  http.Response response = await http.get(url);
  if(response.statusCode == 200){
    var jsonResponse = jsonDecode(response.body);
  }
  return response.body;
}

Future<List<CustomElement>> getData() async{
  String jsonSource = await getResponse('https://api.rawg.io/api/games');
  final jsonData = jsonDecode(jsonSource);

  String _metacritic;
  Color _metascoreColor;
  List<String> platforms = [];
  List<CustomElement> elements = [];
  List<Image> imagesFromApi = [];

  for(var _jsonData in jsonData['results']){
    for(var platform in _jsonData['parent_platforms']){
      platforms.add(platform['platform']['slug']);
    }

    for(var _jsonImages in _jsonData['short_screenshots']){
      imagesFromApi.add(Image.network(
        _jsonImages['image'],
        fit: BoxFit.fitHeight,
      ));
    }

    if(_jsonData['metacritic'] == null){
      _metacritic = '---';
    }else{
      _metacritic = _jsonData['metacritic'].toString();
      if(int.parse(_metacritic) >= 75){
        _metascoreColor = metacritic_color;
      }else if(int.parse(_metacritic) < 75 && int.parse(_metacritic) >= 50){
        _metascoreColor = metacritic_color_orange;
      }else{
        _metascoreColor = metacritic_color_red;
      }
    }

    elements.add(CustomElement(
      imageUrl: _jsonData['background_image'],
      gameName: _jsonData['name'],
      rating: _jsonData['rating'],
      metacritic: _metacritic,
      metacriticColor: _metascoreColor,
      releaseDate: _jsonData['released'],
      platforms: platforms,
      images: imagesFromApi,
    ));
    platforms = [];
    imagesFromApi = [];
  }

  return elements;
}
