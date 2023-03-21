import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
            Positioned(
              left: 24,
              top: size.height * 0.17,
              right: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Masuk",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Isikan data anda untuk masuk ke dalam aplikasi",
                      style: TextStyle(fontSize: 16, color: Colors.white))
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                width: double.infinity,
                height: size.height * 0.58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        key: controller.loginFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              validator: controller.emailValidator,
                              controller: controller.emailController,
                              style: const TextStyle(
                                  color: Color(0xff5B5B5B), fontSize: 12),
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color(0xff0C3B2E),
                                  ),
                                  labelText: "Username / Email",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      color: Color(0xff0C3B2E),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xff0C3B2E)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffFF5D5D)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffFF5D5D)),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx((() => TextFormField(
                                  validator: controller.validator,
                                  controller: controller.passwordController,
                                  obscureText: controller.isShowPassword.value,
                                  style: const TextStyle(
                                      color: Color(0xff5B5B5B), fontSize: 12),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Color(0xff0C3B2E),
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.setIsShowPassword(
                                                !controller
                                                    .isShowPassword.value);
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: Color(0xff0C3B2E),
                                          )),
                                      labelText: "Password",
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                          color: Color(0xff0C3B2E),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xff0C3B2E)),
                                      ),
                                      focusedErrorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xffFF5D5D)),
                                      ),
                                      errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xffFF5D5D)),
                                      ),
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                ))),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              child: const Text("Lupa password?",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xff0C3B2E))),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Belum Punya Akun?",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff0C3B2E)),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  doRegister(context);
                                },
                                child: const Text(
                                  "Daftar",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xffBB8A52)),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  controller.login();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0C3B2E),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  doRegister(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.REGISTER);
  }

  doLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.LAYOUT);
  }
}
