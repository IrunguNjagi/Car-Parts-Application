import 'package:car_parts_app/screens/product_page.dart';
import 'package:car_parts_app/widgets/custom_action_bar.dart';
import 'package:car_parts_app/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef =
  FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
              future: _productsRef.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error : ${snapshot.hasError}"),
                    ),
                  );
                }
                //Collection data ready to disp;ay
                if (snapshot.connectionState == ConnectionState.done) {
                  //Display data inside a ListView
                  return ListView(
                    padding: EdgeInsets.only(
                      top: 108,
                      bottom: 12.0,
                    ),
                    children: snapshot.data.docs.map((document) {
                      return ProductCard(
                        title: document.data()['name'],
                        imageUrl: document.data()['image'][0],
                        price: "\$${document.data()['price']}",
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductPage(productId: document.id,)
                            ),
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
          CustomActionBar(
            title: 'Home',
            hasBackArrow: false,
          ),
        ],
      ),
    );
  }
}
