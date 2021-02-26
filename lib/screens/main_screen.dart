import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/models/user_model.dart';
import 'package:planty/providers/users.dart';
import 'package:planty/screens/pages/plants_page.dart';
import 'package:planty/screens/pages/planty_page.dart';
import 'package:planty/screens/premium_screen.dart';
import 'package:planty/widgets/global_goals_message.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  User _currentUser;
  int _selectedIndex = 0;

  Map<String, List<dynamic>> _pageMapping = {
    "Planty": [
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.seedling),
        label: "Planty",
      ),
      PlantyPage(),
    ],
    "My plants": [
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.leaf),
        label: "My Plants",
      ),
      PlantsPage(),
    ],
    "Trending": [
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.chartLine),
        label: "Trending",
      ),
      Text("Under Construction"),
    ],
    "Profile": [
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Profile",
      ),
      Text("Under Construction"),
    ],
  };

  _loadProfile() {
    _currentUser = Provider.of<Users>(context, listen: false).getCurrentUser();
    if (!_currentUser.profilePicture.isEmpty) {
      setState(() {
        _pageMapping.update(
            "Profile",
            (value) => [
                  BottomNavigationBarItem(
                      icon: CircleAvatar(
                          maxRadius: 14,
                          child: Image.network(
                            _currentUser.profilePicture,
                            fit: BoxFit.contain,
                          )),
                      label: "Profile"),
                  Text("Under Construction")
                ]);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    _loadProfile();
  }

  void _startTimer() async {
    await Future.delayed(Duration(minutes: 5));
    showDialog(context: context, builder: (_) => GlobalGoalMessage())
        .then((value) => _startTimer());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showPremium(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Premium functions will soon be added"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Add Plant"),
                        content: Form(
                            child: Column(
                          children: [
                            TextFormField(
                              decoration:
                                  InputDecoration(hintText: "Plant Name"), keyboardType: TextInputType.text
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(hintText: "Image Url"), keyboardType: TextInputType.url
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(hintText: "Amount of Water"), keyboardType: TextInputType.number,
                            )
                          ],
                        )),
                      );
                    });
              }, //TODO add new plant
            )
          : null,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _pageMapping.keys.elementAt(_selectedIndex),
          style: TextStyle(fontFamily: "Monotype", fontSize: 36),
        ),
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.gem),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PremiumScreen()))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [..._pageMapping.values.map((e) => e.elementAt(0))],
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _pageMapping.values.elementAt(_selectedIndex).elementAt(1)
            as Widget,
      ),
    );
  }
}
