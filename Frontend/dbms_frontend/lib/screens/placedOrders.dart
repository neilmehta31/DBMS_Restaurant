import 'package:dbms_frontend/util/const.dart';
import 'package:dbms_frontend/widgets/badge.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'home.dart';
import 'join.dart';
import 'profile.dart';

class PlacedOrders extends StatefulWidget {
  @override
  _PlacedOrdersState createState() => _PlacedOrdersState();
}

class _PlacedOrdersState extends State<PlacedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your Placed Orders Status',
        ),
        elevation: 5.0,
        actions: [
          IconButton(
            icon: IconBadge(
              icon: Icons.arrow_back,
              size: 22.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
