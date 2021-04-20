import 'dart:convert';

import 'package:dbms_frontend/screens/search.dart';
import 'package:dbms_frontend/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:dbms_frontend/widgets/grid_product.dart';
import 'package:dbms_frontend/util/foods.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  List mealsdata;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    getMealsDatafunc();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Search'),
        elevation: 4.0,
        icon: Icon(Icons.search),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext builder) => SearchScreen())),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Menu Items",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: mealsdata == null ? 0 : mealsdata.length,
              itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                Map food = foods[index];
//                print(foods);
//                print(foods.length);
                return GridProduct(
                  img: food['img'],
                  name: mealsdata[1],
                  rating: mealsdata[3],
                  raters: 23,
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

  getMealsDatafunc() async {
    var apiservice = ApiService();
    var meals = await apiservice.getMealsData();
    List<dynamic> mealslist = jsonDecode(meals);
    setState(() {
      mealsdata = mealslist;
    });
    print('meals data in profile is =' + mealsdata.length.toString());
  }
}
