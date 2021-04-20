import 'package:dbms_frontend/widgets/madeDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dbms_frontend/screens/home.dart';
import 'package:dbms_frontend/screens/profile.dart';
import 'package:dbms_frontend/screens/search.dart';
import 'package:dbms_frontend/util/const.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        drawer: MakeDrawer(pageController: pageController),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            Constants.appName,
          ),
          elevation: 5.0,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            Home(),
            SearchScreen(),
            Profile(),
          ],
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
