import 'package:dbms_frontend/screens/home.dart';
import 'package:dbms_frontend/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:dbms_frontend/util/const.dart';
import 'package:dbms_frontend/util/foods.dart';
import 'package:dbms_frontend/widgets/smooth_star_rating.dart';

import 'join.dart';
import 'placedOrders.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: Drawer(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Home();
                }));
                // Update the state of the app.
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Order Status'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext builder) => PlacedOrders()));
                // Update the state of the app.
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Edit Profile'),
              leading: Icon(Icons.person),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Profile();
                }));
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
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Card(
              elevation: 6.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Search..",
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _searchControl,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: foods == null ? 0 : foods.length,
              itemBuilder: (BuildContext context, int index) {
                Map food = foods[index];
                return ListTile(
                  title: Text(
                    "${food['name']}",
                    style: TextStyle(
//                    fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(
                      "${food['img']}",
                    ),
                  ),
                  trailing: Text(r"$10"),
                  subtitle: Row(
                    children: <Widget>[
                      SmoothStarRating(
                        starCount: 1,
                        color: Constants.ratingBG,
                        allowHalfRating: true,
                        rating: 5.0,
                        size: 12.0,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        "5.0 (23 Reviews)",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                );
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
