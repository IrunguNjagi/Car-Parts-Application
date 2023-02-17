import 'package:car_parts_app/services/firebase_services.dart';
import 'package:car_parts_app/widgets/custom_action_bar.dart';
import 'package:car_parts_app/widgets/image_swipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProductPage extends StatefulWidget {
  final String productId;


  ProductPage({this.productId});


  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseServices _firebaseServices = FirebaseServices();


  int _selectedSize = 0;

  Future _addtoCart() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection('Cart')
        .doc(widget.productId)
        .set(
        {
          'size': 1,
        }
    );
  }
  Future _addtoSaved() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection('Saved')
        .doc(widget.productId)
        .set(
        {
          'size': 1,
        }
    );


    //_usersRef.doc(_user.uid).collection("Cart").doc(widget.ProductId).set(),

  }

  final SnackBar _snackBar = SnackBar(
    content: Text('Product Added to the cart'),
  );
  final SnackBar _snackBar2 = SnackBar(
    content: Text('Product Saved'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: _firebaseServices.productsRef.doc(widget.productId).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error : ${snapshot.hasError}"),
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  //Firebase Document Data Map

                  Map<String, dynamic> documentData = snapshot.data.data();
                  //List of Images and Sizes from Cloud Firestore

                  List imageList = documentData['image'];
                  //List of product sizes from Cloud Firestore
                  List productSizes = documentData['sizes'];
                  return ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      imageSwipe(
                        imageList: imageList,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        child: Text(
                          "${documentData['name']}" ?? 'Product Name',
                          style: Constants.boldHeading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 6.0,
                        ),
                        child: Text(
                          "\$${documentData['price']}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme
                                .of(context)
                                .accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 6.0,
                        ),
                        child: Text(
                          "${documentData['desc']}",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 6.0,
                        ),
                        child: Text(
                          'Select Size',
                          style: Constants.regularDarkStyle,
                        ),
                      ),
                      //for select size button
                      Row(
                        children: [
                          for(var i = 0; i < productSizes.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedSize = i;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 42.0,
                                  height: 42.0,
                                  decoration: BoxDecoration(

                                    color: _selectedSize == i ? Theme
                                        .of(context)
                                        .accentColor : Color(0xFFDCDCDC),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text
                                    ("${productSizes[i]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                      color: _selectedSize == i
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: [

                            GestureDetector(
                              onTap: () async {
                                await _addtoSaved();
                                print('product saved');
                                Scaffold.of(context).showSnackBar(_snackBar2);
                              },
                              child: Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12.0),

                                ),
                                // alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/save.png'
                                  ),
                                  width: 20.0,
                                  height: 21.0,
                                ),

                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  await _addtoCart();
                                  print('product added to cart');
                                  Scaffold.of(context).showSnackBar(_snackBar);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 16.0,
                                  ),
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Center(
                                    child: Text('Add to cart', style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }

                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
          CustomActionBar(
            hasBackArrow: true,
            hasTitle: false,
            hasBackground: false,
          )
        ],
      ),
    );
  }
}
