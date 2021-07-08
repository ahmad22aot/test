import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/bind.dart';
import 'package:store/screen/Cart.dart';
import 'package:store/screen/History.dart';
import 'package:store/screen/Items.dart';
import 'package:store/screen/Point.dart';

import 'screen/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Bind(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _tabItems = [Home(), Item(), Cart(), Point(), History()];
  int _activePage = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        // bottomNavigationBar: ,
        body: Stack(
          children: <Widget>[
            _tabItems[_activePage],
            Align(
              alignment: Alignment.bottomCenter,
              child: CurvedNavigationBar(
                key: _bottomNavigationKey,
                index: 0,
                height: 60.0,
                items: <Widget>[
                  Icon(Icons.add, size: 30),
                  Icon(Icons.list, size: 30),
                  Icon(Icons.compare_arrows, size: 30),
                  Icon(Icons.call_split, size: 30),
                  Icon(Icons.perm_identity, size: 30),
                ],
                color: Colors.greenAccent,
                buttonBackgroundColor: Colors.greenAccent,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 400),
                onTap: (index) {
                  setState(() {
                    _activePage = index;
                  });
                },
                letIndexChange: (index) => true,
              ),
            )
          ],
        ));
  }
}
