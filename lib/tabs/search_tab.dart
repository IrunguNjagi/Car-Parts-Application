import 'package:car_parts_app/screens/product_page.dart';
import 'package:car_parts_app/services/firebase_services.dart';
import 'package:car_parts_app/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  FirebaseServices _firebaseServices = FirebaseServices();

  String _searchString = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8.0,
        left: 40,
        right: 40,
        bottom: 40,
      ),
      child: Stack(
        children: [
          if(_searchString.isEmpty)
            Center(
              child: Container(
                child: Text("Search Results",
                  style: Constants.regularDarkStyle,),
              ),
            )
          else
            FutureBuilder<QuerySnapshot>(
                future: _firebaseServices.productsRef
                    .orderBy('search_string')
                    .startAt([_searchString])
                    .endAt(["$_searchString\uf8ff"])
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error : ${snapshot.hasError}"),
                      ),
                    );
                  }
                  //Collection data ready to display
                  if (snapshot.connectionState == ConnectionState.done) {
                    //Display data inside a ListView
                    return ListView(
                      padding: EdgeInsets.only(
                        top: 108,
                        bottom: 12.0,
                      ),
                      children: snapshot.data.docs.map((document) {
                        return ProductCard(
                          title: document.data()['search_string'],
                          imageUrl: document.data()['image'][0],
                          price: "\$${document.data()['price']}",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                    productId: document.id,
                                  )),
                            );
                          },
                        );
                      }).toList(),
                    );
                  }

                  //Loading State
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
            ),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Search for product",
                    fillColor: Colors.grey[100]),
                onSubmitted: (value) {
                  setState(() {
                    _searchString = value.toLowerCase();
                  });
                }
            ),
          ),
        ],
      ),
    );
  }
}
