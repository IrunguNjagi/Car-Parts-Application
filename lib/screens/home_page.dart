import 'package:car_parts_app/services/firebase_services.dart';
import 'package:car_parts_app/tabs/home_tab.dart';
import 'package:car_parts_app/tabs/save_tab.dart';
import 'package:car_parts_app/tabs/search_tab.dart';
import 'package:car_parts_app/widgets/bottom_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseServices _firebaseServices = FirebaseServices();

  PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {

    print("User ID: ${_firebaseServices.getUserId()}");
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView(
                controller: _tabsPageController,
                onPageChanged: (num){
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [
                  HomeTab(),
                  SearchTab(),
                  SaveTab(),
                ],
              ),
            ),
            BottomTabs(
              selectedTab: _selectedTab,
              tabPressed: (num){
                _tabsPageController.animateToPage(num,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic);
              },

            ),
          ],
        ));
  }
}
