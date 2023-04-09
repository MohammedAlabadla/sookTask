import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sookps/screens/repositories/repositories_scr.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Image.asset('assets/images/sook_img.png'),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 20.0),
              child: AnimatedTextKit(
                onFinished: () => Get.offAll(() => RepositoriesScreen()),
                totalRepeatCount: 1,
                animatedTexts: [
                  WavyAnimatedText(
                    'Sook Job Task',
                    speed: Duration(milliseconds: 250),
                    textStyle: TextStyle(
                      color: Colors.cyan,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
