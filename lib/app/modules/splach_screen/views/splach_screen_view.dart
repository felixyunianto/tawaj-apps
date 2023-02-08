import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:tawaj/app/routes/app_pages.dart';

import '../controllers/splach_screen_controller.dart';

class SplachScreenView extends GetView<SplachScreenController> {
  const SplachScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    startApp(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xff6D9773), Color(0xff0C3B2E)])),
            child: Stack(
              children: [
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Tawaj",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
                const Align(
                    alignment: Alignment(0, 0.92),
                    child: Text(
                      "Development by Felix Yunianto Gunawan",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )),
                Align(
                  alignment: const Alignment(0, 0.85),
                  child: JumpingDotsProgressIndicator(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                )
              ],
            )));
  }

  startApp(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.LAYOUT);
    });
  }
}
