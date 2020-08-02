import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RecentHaps extends StatefulWidget {
  @override
  _RecentHapsState createState() => _RecentHapsState();
}

class _RecentHapsState extends State<RecentHaps> {
  var _current = 0;
  var _imgList = [
    'https://images.pexels.com/photos/3893532/pexels-photo-3893532.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'https://images.pexels.com/photos/3845344/pexels-photo-3845344.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'https://images.pexels.com/photos/3662910/pexels-photo-3662910.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'https://images.pexels.com/photos/3771510/pexels-photo-3771510.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/4127417/pexels-photo-4127417.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: CarouselSlider(
        height: 200,
        initialPage: 0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(seconds: 2),
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
        items: _imgList.map((imgUrl) {
          return Builder(builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                  )
                ],
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
