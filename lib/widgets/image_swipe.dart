import 'package:flutter/material.dart';

class imageSwipe extends StatefulWidget {
  final List imageList;
  imageSwipe({this.imageList});

  @override
  _imageSwipeState createState() => _imageSwipeState();
}

class _imageSwipeState extends State<imageSwipe> {

  int _selectedPage = 0;


  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 350.0,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (num) {
              setState(() {
                _selectedPage = num;
              });
            },
            children: [
              for(var i=0;i <widget.imageList.length; i++)
                Container(
                  child: Image.network("${widget.imageList[i]}"),
                ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var i=0;i <widget.imageList.length; i++)
                  AnimatedContainer(
                    duration: Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.easeOutCubic,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    height: 10.0,
                    width:_selectedPage == i ? 35.0 : 10.0 ,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );

  }
}
