import 'package:flutter/material.dart';
import 'package:dbms_frontend/util/tableDetails.dart';

import 'main_screen.dart';

class TableReserve extends StatefulWidget {
  @override
  _TableReserveState createState() => _TableReserveState();
}

class _TableReserveState extends State<TableReserve> {
  @override
  void initState() {
    super.initState();
    isSelected;
    colour = colour;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reserve Your table"),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('resrvergiftable.gif'),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    gestureTable(context, 1),
                    gestureTable(context, 2),
                    gestureTable(context, 3),
                    gestureTable(context, 4),
                    gestureTable(context, 5),
                    gestureTable(context, 6),
                    gestureTable(context, 7),
                    gestureTable(context, 8),
                    gestureTable(context, 9),
                    gestureTable(context, 10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    gestureTable(context, 11),
                    gestureTable(context, 12),
                    gestureTable(context, 13),
                    gestureTable(context, 14),
                    gestureTable(context, 15),
                    gestureTable(context, 16),
                    gestureTable(context, 17),
                    gestureTable(context, 18),
                    gestureTable(context, 19),
                    gestureTable(context, 20),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    gestureTable(context, 21),
                    gestureTable(context, 22),
                    gestureTable(context, 23),
                    gestureTable(context, 24),
                    gestureTable(context, 25),
                    gestureTable(context, 26),
                    gestureTable(context, 27),
                    gestureTable(context, 28),
                    gestureTable(context, 29),
                    gestureTable(context, 30),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 50,
                            width: 125,
                            child: InkWell(
                              focusColor: Colors.orange,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange)),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return MainScreen();
                                    }));
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Proceed',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                        Icon(Icons.navigate_next)
                                      ],
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector gestureTable(BuildContext context, int id) {
    return GestureDetector(
      child: buildTable(context, id, colour[id]),
      onTap: () {
        // print('tappped' + id.toString());
        setState(() {
          isSelected[id] = !isSelected[id];
          // print(isSelected.toString());
          isSelected[id] ? colour[id] = Colors.grey : colour[id] = Colors.white;
        });
      },
    );
  }

  Card buildTable(BuildContext context, int id, Color colour) {
    return Card(
      color: colour,
      borderOnForeground: true,
      elevation: 10.0,
      child: Container(
        height: MediaQuery.of(context).size.height / 20,
        width: MediaQuery.of(context).size.width / 20,
        child: Center(child: Text('Table $id')),
      ),
    );
  }
}
