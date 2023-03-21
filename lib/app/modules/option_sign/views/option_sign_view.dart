import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/routes/app_pages.dart';

import '../controllers/option_sign_controller.dart';

class OptionSignView extends GetView<OptionSignController> {
  const OptionSignView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child:
                      Image.asset('assets/img/bg_sign.png', fit: BoxFit.cover)),
              Positioned(
                  child: Container(
                color: const Color(0xff797979).withOpacity(0.5),
              )),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Selamat Datang",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                                "Petunjuk tidak bisa dicapai kecuali oleh pengetahuan. Dan, arah tujuan yang benar tidak akan bisa dituju kecuali dengan kesabaran.",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white))
                          ],
                        ),
                        const SizedBox(
                          height: 41,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    doLogin(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff0C3B2E),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text("Masuk")),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    doRegister(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffCCCCCC),
                                    foregroundColor: const Color(0xffBB8A52),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text("Daftar")),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offAllNamed(Routes.LAYOUT);
                              },
                              child: const Text(
                                "Guest Mode",
                                style: TextStyle(
                                  color: const Color(0xffCACACA),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              )
            ],
          )),
    );
  }

  doLogin(BuildContext context) {
    Get.toNamed(Routes.LOGIN);
  }

  doRegister(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.REGISTER);
  }

  doGuest(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.LAYOUT);
  }
}
