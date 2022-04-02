import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Screen/dashboard.dart';
import '../../Theme/size_config.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/start.webp',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/nike.webp',
                  width: resW(70),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: resH(35),
                  child: DefaultTextStyle(
                    style: GoogleFonts.dmSans(
                      fontSize: resW(20),
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText('AWESOME UI'),
                        FadeAnimatedText('Developed with Flutter'),
                        FadeAnimatedText('by Pouya AKA cyber\$kull'),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => Get.offAll(() => const Dashboard()),
                    child: Text(
                      'Let\'s Start',
                      style: GoogleFonts.archivo(
                        fontSize: resW(20),
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
