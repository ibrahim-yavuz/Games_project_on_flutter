import 'package:flutter/material.dart';

class Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.cancel, size: 15,),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
