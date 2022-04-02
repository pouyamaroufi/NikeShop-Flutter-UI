import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../Screen/home_screen.dart';
import '../../Theme/color.dart';
import '../Theme/size_config.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //these are the screens that will be loaded for every bottom nav item
        children: <Widget>[
          IndexedStack(
            index: pageIndex,
            children: pageList,
          ),
          _buildBottomNavigation()
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() => Align(
        alignment: FractionalOffset.bottomCenter,
        //this is very important, without it the whole screen will be blurred
        child: ClipRect(
          //I'm using BackdropFilter for the blurring effect
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Opacity(
              //you can change the opacity to whatever suits you best
              opacity: 0.8,
              child: BottomNavigationBar(
                backgroundColor: Colors.white.withAlpha(200),
                elevation: 10,
                selectedItemColor: mainColor,
                unselectedItemColor: Colors.black38,
                onTap: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                currentIndex: pageIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: (pageIndex == 0)
                          ? const CustomIcon(icon: 'home')
                          : const CustomIconOff(icon: 'home-off'),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: (pageIndex == 1)
                          ? const CustomIcon(icon: 'cart')
                          : const CustomIconOff(icon: 'cart-off'),
                      label: 'explore'),
                  BottomNavigationBarItem(
                      icon: (pageIndex == 2)
                          ? const CustomIcon(icon: 'like')
                          : const CustomIconOff(icon: 'like-off'),
                      label: 'like'),
                  BottomNavigationBarItem(
                      icon: (pageIndex == 3)
                          ? const CustomIcon(icon: 'profile')
                          : const CustomIconOff(icon: 'profile-off'),
                      label: 'profile'),
                ],
              ),
            ),
          ),
        ),
      );
}

class CustomIcon extends StatelessWidget {
  final String icon;

  const CustomIcon({Key? key, required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: resW(40),
      height: resW(40),
      child: Image.asset('assets/icons/$icon.webp'),
    );
  }
}

class CustomIconOff extends StatelessWidget {
  final String icon;

  const CustomIconOff({Key? key, required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: resW(20),
      height: resW(20),
      child: Image.asset(
        'assets/icons/$icon.webp',
        colorBlendMode: BlendMode.hue,
      ),
    );
  }
}
