import 'dart:convert';

import 'package:dbms_frontend/screens/placedOrders.dart';
import 'package:dbms_frontend/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dbms_frontend/util/foods.dart';
import 'package:dbms_frontend/widgets/cart_item.dart';

class Checkout extends StatefulWidget {
  final String name;
  final String img;
  final double rating;
  final int index;
  final int price;
  final int quantity;

  Checkout(@required this.name, @required this.img, @required this.rating,
      @required this.index, @required this.price, @required this.quantity);
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List mealsdata;
  final TextEditingController _couponlControl = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getMealsDatafunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 130),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),
            Text(
              "Item",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: mealsdata == null ? 0 : 1,
              itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);

//                print(foods);
//                print(foods.length);
                return CartItem(
                    img: widget.img,
                    index: widget.index,
                    name: widget.name,
                    rating: widget.rating,
                    price: widget.price,
                    quantity: widget.quantity);
              },
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4.0,
          child: Container(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            r"$ " + "${widget.price}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                      width: 150.0,
                      height: 50.0,
                      child: FlatButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "Place Order".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          takeOrder(widget.name);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            height: 60,
          ),
        ),
      ),
    );
  }

  getMealsDatafunc() async {
    var apiservice = ApiService();
    var meals = await apiservice.getMealsData();
    List<dynamic> mealslist = jsonDecode(meals);
    setState(() {
      mealsdata = mealslist;
    });
    print('meals data in profile is =' + mealsdata.length.toString());
  }

  takeOrder(mealId) async {
    var apiservice = ApiService();
    var meals = await apiservice.takeOrder(mealId);
    if (meals == 'true') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return PlacedOrders();
          },
        ),
      );
    }
  }
}
