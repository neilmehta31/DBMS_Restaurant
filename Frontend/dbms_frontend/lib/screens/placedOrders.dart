import 'package:dbms_frontend/util/const.dart';
import 'package:flutter/material.dart';

class PlacedOrders extends StatefulWidget {
  @override
  _PlacedOrdersState createState() => _PlacedOrdersState();
}

class _PlacedOrdersState extends State<PlacedOrders> {
  @override
  Widget build(BuildContext context) {
    Color statusColour = Constants.statusColourAccepted;
    Text statusText = Constants.statusTextAccepted;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Placed Orders Status'),
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              width: double.infinity,
              height: 70,
              child: Card(
                elevation: 4.0,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 7),
                      child: Icon(
                        Icons.fastfood,
                        size: 50.0,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Positioned(
                      left: 75,
                      top: 15,
                      child: Text("Order ID : 1234"),
                    ),
                    Positioned(
                      left: 75,
                      bottom: 15,
                      child: Text(
                        "Price " + r"$212",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 12.5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: statusColour,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 40,
                        width: 150,
                        child: Center(child: statusText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
