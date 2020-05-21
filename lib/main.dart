import 'package:flutter/material.dart';
import 'package:games/contraints.dart';
import 'package:games/game_details.dart';
import 'list_of_games.dart';
import 'loading_screen.dart';
import 'routes.dart' as router;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.generateRoute,
    initialRoute: '/',
  ));
}

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {

  void addItemToList() async{
    custom_elements = await getData();
    setState(() {
      listOfGames = custom_elements;
    });
  }

  @override
  void initState() {
    super.initState();
    addItemToList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text('Games'),
          centerTitle: true,
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu, color: Colors.white,),
          ),
        ),
        body: ListView.builder(
            itemCount: listOfGames.length,
            cacheExtent: 1300,
            addAutomaticKeepAlives: true,
            itemBuilder: (BuildContext context, int index){
              return listOfGames.elementAt(index);
            }
        ),
      );
  }
}
