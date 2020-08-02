import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final int index;

  Avatar(this.index);

  @override
  Widget build(BuildContext context) {
    //returns an avatar of photo and mood
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          //photo
          CircleAvatar(
            radius: 38,
            backgroundImage: NetworkImage(
              'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/15/08/gettyimages-960033612.jpg?w968h681',
            ),
          ),
          //emotion at bottom right
          Positioned(
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(0xFFEEE9D9),
              child: Icon(
                Icons.sentiment_very_satisfied,
                color: Color(0xFFA57F00),
                size: 24,
              ),
            ),
            right: 0.0,
            bottom: 0.0,
          )
        ],
      ),
    );
  }
}
