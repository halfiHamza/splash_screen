
import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen/controllers/splash_controller.dart';
import 'package:splash_screen/screens/splash/loading.dart';
import 'package:splash_screen/screens/splash/login.dart';

class MainForm extends StatelessWidget {
  MainForm({Key? key}) : super(key: key);
  final SplashController splashController = Get.put(SplashController());
  List<Widget> pages = [
    const SplashScreen(),
    const LoginForm()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => TransformerPageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: splashController.controller,
        loop: false,
        pageSnapping: false,
        transformer: ScaleAndFadeTransformer(),
        duration: const Duration(milliseconds: 1300),
        viewportFraction: 0.8,
        index: splashController.selectedPage.value,
        itemBuilder: (BuildContext context, int index) {
          return pages[index];
        },
        itemCount: 2,
      )),
    );
  }
}

class ScaleAndFadeTransformer extends PageTransformer {
  final double _scale;
  final double _fade;

  ScaleAndFadeTransformer({double fade = 0.3, double scale = 0.8})
      : _fade = fade,
        _scale = scale;

  @override
  Widget transform(Widget child, TransformInfo info) {
    final position = info.position!;
    final scaleFactor = (1 - position.abs()) * (1 - _scale);
    final fadeFactor = (1 - position.abs()) * (1 - _fade);
    final opacity = _fade + fadeFactor;
    final scale = _scale + scaleFactor;
    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: child,
      ),
    );
  }
}
