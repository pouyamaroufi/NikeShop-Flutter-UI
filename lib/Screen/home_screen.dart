import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Theme/color.dart';
import '../../Theme/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> explorerData = ['shoe-01', 'shoe-02', 'shoe-03'];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(200),
        title: Text(
          'Home',
          style: GoogleFonts.dmSans(
            fontSize: resW(20),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: explorerData.length,
        itemBuilder: (ctx, i) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            clipBehavior: Clip.hardEdge,
            //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent[100]!.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 160,
                  bottom: 150,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text('Price',
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700, color: mainColor)),
                      subtitle: Text(
                        '\$34.99',
                        style: TextStyle(
                            fontFamily: GoogleFonts.bebasNeue().fontFamily,
                            color: mainColor,
                            fontSize: resW(28)),
                      ),
                      trailing: Image.asset('assets/icons/Shopping-bag.webp'),
                    ),
                    Image.asset('assets/images/${explorerData[i]}.webp'),
                    ListTile(
                      title: const Text('Michael Jordan'),
                      subtitle: Text(
                        'exclusive collection',
                        style: TextStyle(
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          color: subtitleColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
