import 'package:flutter/material.dart';
import 'package:games/custom_listview_elements.dart';
import 'contraints.dart';

//class GameDetails extends StatefulWidget {
//  @override
//  _GameDetailsState createState() => _GameDetailsState();
//}

class GameDetails extends StatelessWidget {
  final CustomElement element;
  GameDetails({Key key, this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(element.gameName),
          centerTitle: true,
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 30,
                child: ListView.builder(
                  itemCount: element.platforms.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PlatformContainer(
                      color: playstation_color,
                      platformName: element.platforms.elementAt(index),
                    );
                  },
                ),
              ),
              PhotosContainer(
                images: element.images,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlatformContainer extends StatelessWidget {
  Color color, textColor;
  String platformName;
  PlatformContainer({this.color, this.platformName});

  Color getColor() {
    switch (this.platformName) {
      case 'playstation':
        textColor = Colors.white;
        return playstation_color;
      case 'xbox':
        textColor = Colors.white;
        return xbox_color;
      case 'android':
        textColor = Colors.white;
        return android_color;
      case 'nintendo':
        textColor = Colors.white;
        return nintendo_color;
      default:
        textColor = Colors.black;
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(left: 2, right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border(
          top: BorderSide(width: 2, color: getColor()),
          bottom: BorderSide(width: 2, color: getColor()),
          right: BorderSide(width: 2, color: getColor()),
          left: BorderSide(width: 2, color: getColor()),
        ),
        color: getColor(),
      ),
      child: Center(
        child: Text(
          platformName.toUpperCase(),
          style: TextStyle(color: this.textColor, fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}

class PhotosContainer extends StatefulWidget {
  List<Image> images = [];
  PhotosContainer({this.images});

  @override
  _PhotosContainerState createState() => _PhotosContainerState();
}

class _PhotosContainerState extends State<PhotosContainer> {
  Container dot(Color color, int _height, int _weight){
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.green),
          top: BorderSide(width: 1.0, color: Colors.green),
          left: BorderSide(width: 1.0, color: Colors.green),
          right: BorderSide(width: 1.0, color: Colors.green),
        ),
        color: color,
      ),
      height: _height.toDouble(),
      width: _weight.toDouble(),
    );
  }

  List<Container> dotList = [];

  void addDotsToList(){
    for(int i = 0; i < this.widget.images.length; i++){
      dotList.add(dot(null, 10, 10));
    }
  }

  @override
  void initState() {
    super.initState();
    addDotsToList();
    makeColoured(0, 1);
  }

  void makeColoured(int i, int length){
    setState(() {
      Container _containerGreen = dot(Colors.green, 13,13);
      Container _containerWhite = dot(null, 10,10);
      for(int k = 0; k < length; k++){
        if(i == k){
          dotList[i] = _containerGreen;
        }else{
          dotList[k] = _containerWhite;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          margin: EdgeInsets.only(top: 10),
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: this.widget.images,
            onPageChanged: (value) {
              makeColoured(value, this.widget.images.length);
            },
            controller: PageController(
              initialPage: 0,
            ),
          ),
        ),
        Container(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dotList,
          ),
        )
      ],
    );
  }
}
