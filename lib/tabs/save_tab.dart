import 'package:car_parts_app/screens/product_page.dart';
import 'package:car_parts_app/services/firebase_services.dart';
import 'package:car_parts_app/widgets/custom_action_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SaveTab extends StatelessWidget {

  final FirebaseServices _firebaseServices = FirebaseServices();




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
              future: _firebaseServices.usersRef.doc(_firebaseServices.getUserId())
                  .collection('Saved').get(),
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
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductPage(productId: document.id,),
                          )
                          );
                        },
                        child: FutureBuilder(
                          future: _firebaseServices.productsRef.doc(document.id).get(),
                          builder: (context,productSnap){
                            if(productSnap.hasError){
                              return Container(
                                child: Center(
                                  child: Text("${productSnap.error}"),
                                ),
                              );
                            };

                            if(productSnap.connectionState == ConnectionState.done){
                              Map _productMap = productSnap.data.data();

                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 24,
                                  ),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 90,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.network(
                                            "${_productMap['image'][0]}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 16.0,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${_productMap['name']}",
                                              style: TextStyle(
                                                  fontSize: 18 ,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 4.0,
                                              ),
                                              child: Text(
                                                "\$${_productMap['price']}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0,
                                                  color: Theme.of(context).accentColor,
                                                ),
                                              ),
                                            )

                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              );
                            };

                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );


                          },
                        ),
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
            title: 'Saved',
            hasBackArrow: false,
          ),
        ],
      ),
    );
  }
}
