import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:games/game_details.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CustomElement extends StatelessWidget {
  String imageUrl;
  String gameName;
  String releaseDate;
  String metacritic;
  Color metacriticColor;
  double rating;
  List<String> platforms;
  List<Image> images;

  CustomElement({
    this.imageUrl,
    this.gameName,
    this.releaseDate,
    this.rating,
    this.metacritic,
    this.metacriticColor,
    this.platforms,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, bottom: 7),
      child: RawMaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => GameDetails(element: this,),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Image.network(
                  'https://img.gs/gmkzqtnlbt/quality=medium,400x400,fit/'+imageUrl,
                  height: 81,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SmoothStarRating(
                              rating: this.rating,
                              allowHalfRating: false,
                            ),
                            Text(
                              gameName,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              releaseDate,
                              style: TextStyle(
                                fontSize: 13,
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, //TODO: add space between these two widgets
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.only(left: 12, right: 12, top: 5,bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border(
                              top: BorderSide(width: 1.0, color: this.metacriticColor),
                              bottom: BorderSide(width: 1.0, color: this.metacriticColor),
                              left: BorderSide(width: 1.0, color: this.metacriticColor),
                              right: BorderSide(width: 1.0, color: this.metacriticColor),
                            )
                          ),
                          child: Text(metacritic, style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: this.metacriticColor,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        /*child: Row(

        ),*/
      ),
    );
  }
}