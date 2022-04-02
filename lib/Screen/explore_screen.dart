import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Theme/color.dart';
import '../../Theme/size_config.dart';
import '../Model/explorer_model.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ExploreModel> explorerData = [
      //ExploreModel('shoe-02', const Color(0xFFB7D261)),
      ExploreModel('shoe-01', const Color(0xFFF43440)),
      ExploreModel('shoe-03', const Color(0xFF2B50E0)),
      ExploreModel('shoe-04', const Color(0xFF219700)),
      ExploreModel('shoe-05', const Color(0xFF7222D3)),
      ExploreModel('shoe-06', const Color(0xFF927500)),
    ];
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
          'Explore',
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
                    color: explorerData[i].color,
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
                      '\$189.99',
                      style: TextStyle(
                          fontFamily: GoogleFonts.bebasNeue().fontFamily,
                          color: mainColor,
                          fontSize: resW(28)),
                    ),
                    trailing: Image.asset('assets/icons/Shopping-bag.webp'),
                  ),
                  Image.asset('assets/images/${explorerData[i].name}.webp'),
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
          ),
        ),
      ),
    );
  }
}
