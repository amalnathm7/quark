import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quark/main.dart';
import 'package:quark/main_screen/electric_car_page/electric_car.dart';
import 'package:quark/main_screen/home_page/home.dart';
import 'package:quark/main_screen/profile_page/profile.dart';
import 'package:quark/main_screen/topup_page/topup.dart';

class NavBarNew extends StatefulWidget {
  const NavBarNew({Key? key}) : super(key: key);

  @override
  _NavBarNewState createState() => _NavBarNewState();
}

class _NavBarNewState extends State<NavBarNew> {
  int _selectedIndex = 0;
  final PageController _controllerPage = PageController();
  bool notify = false;

  @override
  void initState() {
    MyApp.db.listen();
    MyApp.db.addListener(listener);
    super.initState();
  }

  void listener() async {
    setState(() {});
  }

  @override
  void dispose() {
    MyApp.db.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        controller: _controllerPage,
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomePage(),
          TopUpPage(),
          ElectricCar(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: screenHeight * .1 <= 60 ? 60 : screenHeight * .1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  //depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              onPressed: () {
                setState(() {
                  int prev = _selectedIndex;
                  _selectedIndex = 0;

                  int diff = prev - _selectedIndex;
                  diff.abs() > 1
                      ? _controllerPage.jumpToPage(_selectedIndex)
                      : _controllerPage.animateToPage(_selectedIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                });
              },
              child: _selectedIndex == 0
                  ? const Icon(CupertinoIcons.house_fill)
                  : const Icon(CupertinoIcons.house),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  //depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              onPressed: () {
                setState(() {
                  int prev = _selectedIndex;
                  _selectedIndex = 1;

                  int diff = prev - _selectedIndex;
                  diff.abs() > 1
                      ? _controllerPage.jumpToPage(_selectedIndex)
                      : _controllerPage.animateToPage(_selectedIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                });
              },
              child: _selectedIndex == 1
                  ? const Icon(CupertinoIcons.bag_fill)
                  : const Icon(CupertinoIcons.bag),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  //depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              onPressed: () {
                setState(() {
                  int prev = _selectedIndex;
                  _selectedIndex = 2;

                  int diff = prev - _selectedIndex;
                  diff.abs() > 1
                      ? _controllerPage.jumpToPage(_selectedIndex)
                      : _controllerPage.animateToPage(_selectedIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                });
              },
              child: _selectedIndex == 2
                  ? const Icon(CupertinoIcons.car_fill)
                  : const Icon(CupertinoIcons.car_detailed),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  //depth: 8,
                  lightSource: LightSource.topLeft,
                  color: notify ? Colors.green[100] : Colors.white),
              onPressed: () {
                setState(() {
                  int prev = _selectedIndex;
                  _selectedIndex = 3;
                  notify = false;

                  int diff = prev - _selectedIndex;
                  diff.abs() > 1
                      ? _controllerPage.jumpToPage(_selectedIndex)
                      : _controllerPage.animateToPage(_selectedIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                });
              },
              child: _selectedIndex == 3
                  ? const Icon(
                      CupertinoIcons.person_solid,
                      size: 27,
                    )
                  : const Icon(
                      CupertinoIcons.person,
                      size: 27,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
