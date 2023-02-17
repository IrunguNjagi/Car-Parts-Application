import 'package:car_parts_app/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productId;

  final Function onPressed;
  final String imageUrl;
  final String title;
  final String price;

  ProductCard({this.onPressed,this.imageUrl,this.title,this.price,this.productId});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0)),
          height: 250,
          margin: EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 24.0,
          ),
          child: Stack(
            children: [
              Container(
                height: 350.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    "$imageUrl",
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  //wrap row with padding and set edege insets to only with a value of 20.0
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Constants.regularHeading,
                    ),
                    Text(
                      //for price wrap the document.data inside a string
                      price,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
