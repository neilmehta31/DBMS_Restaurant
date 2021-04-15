import 'package:dbms_frontend/screens/join.dart';
import 'package:dbms_frontend/screens/placedOrders.dart';
import 'package:flutter/material.dart';

class MakeDrawer extends StatelessWidget {
  const MakeDrawer({
    Key key,
    @required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(
                    Icons.person_pin,
                    size: 100,
                  ),
                  Text('Hey User'),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              _pageController.jumpToPage(0);
              // Update the state of the app.
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Cart'),
            leading: Icon(Icons.shopping_cart_rounded),
            onTap: () {
              // Update the state of the app.
              _pageController.jumpToPage(2);
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Order Status'),
            leading: Icon(Icons.food_bank_sharp),
            onTap: () {
              print('tapped order Status in drawer!!');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext builder) => PlacedOrders()));
            },
          ),
          ListTile(
            title: Text('Edit Profile'),
            leading: Icon(Icons.person),
            onTap: () {
              // Update the state of the app.
              _pageController.jumpToPage(3);
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            onTap: () {
              // Update the state of the app.
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return JoinApp();
              }));
              // ...
            },
          ),
        ],
      ),
    );
  }
}
