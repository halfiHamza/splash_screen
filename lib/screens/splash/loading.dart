import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:splash_screen/controllers/splash_controller.dart';
import 'package:window_manager/window_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController splashController = Get.put(SplashController());
  List<Color> colorizeColors = [
    Colors.deepOrange,
    Colors.blue,
    Colors.yellow,
    Colors.blueGrey,
  ];
  var colorizeTextStyle = const TextStyle(
    fontSize: 38.0,
    fontFamily: 'BrunoAceSC',
  );

  Stream<num> generateWidth = (() async* {
    for (int i = 1; i <= 630; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
      yield i;
    }
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(builder: (controller)=> Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 0,
            width: 400,
            child: Image.asset("images/japanese_shop.jpg").animate()
                .fade(duration: const Duration(seconds: 1))
                .slide(
                begin: const Offset(1, 0),
                end: const Offset(0, 0),
                duration: const Duration(seconds: 2)),
          ),
          Positioned(
              top: 1,
              left: 1,
              child: IconButton(
                onPressed: () {
                  WindowManager.instance.close();
                },
                icon: const Icon(
                  Icons.close,
                  size: 18,
                ),
              )),
          Row(
            children: [
              Center(
                child: Container(
                  height: 150,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        "HANOUTIY",
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      )
                    ],
                  ),
                ),
              )
                  .animate()
                  .fade(duration: const Duration(seconds: 1))
                  .slide(duration: const Duration(seconds: 2)),
            ],
          ),
          Positioned(
            bottom: 100,
            left: 20,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "WWW.HANOUTIY.DZ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, letterSpacing: 2.0),
                ),
                Text("E-Commerce Inc"),
                SizedBox(height: 20,),
                Text(
                  "Copyright © 2023",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ).animate()
                .fade(duration: const Duration(seconds: 1))
                .slide(
                begin: const Offset(-1, 0),
                end: const Offset(0, 0),
                duration: const Duration(seconds: 2)),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Read database config . . . .'),
                TypewriterAnimatedText('Connect database . . . .'),
                TypewriterAnimatedText('Read data . . . .'),
                TypewriterAnimatedText('Finished')
              ],
              pause: const Duration(milliseconds: 1800),
              totalRepeatCount: 1,
              repeatForever: false,
              onFinished: ()=> controller.changePage(1),
            ),
          ),
          Positioned(
              bottom: 0,
              child: StreamBuilder(
                stream: generateWidth,
                builder: (context, AsyncSnapshot<num> snapshot) {
                  return SizedBox(
                      height: 5,
                      width: snapshot.hasData ? snapshot.data!.toDouble() : 0,
                      child: Container(
                        height: 5,
                        color: Colors.deepOrangeAccent,
                      ));
                },
              ))
        ],
      )),
    );
  }
}
