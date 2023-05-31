import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/user.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          backgroundColor: const Color(0xff0C3B2E),
          centerTitle: false,
        ),
        body: Form(
          key: controller.loginFormKey,
          child: Container(
            padding: EdgeInsets.all(24),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Obx(() => Container(
                                width: 120,
                                height: 120,
                                margin:
                                    const EdgeInsets.only(bottom: 30, top: 19),
                                decoration: BoxDecoration(
                                    color: const Color(0xffABABAB),
                                    borderRadius: BorderRadius.circular(60)),
                                child: Center(
                                  child: Text(
                                    controller.namePerson.value != ""
                                        ? controller.namePerson.value[0]
                                        : "",
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 12, bottom: 10),
                                child: Text(
                                  "Nama Panggilan",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              TextFormField(
                                controller: controller.nameController,
                                style: const TextStyle(
                                    color: Color(0xff5B5B5B), fontSize: 12),
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: "Nama",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xff0C3B2E),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xff0C3B2E)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12, bottom: 10, top: 10),
                                child: Text(
                                  "Email",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              TextFormField(
                                enabled: false,
                                controller: controller.emailController,
                                style: const TextStyle(
                                    color: Color(0xff5B5B5B), fontSize: 12),
                                decoration: const InputDecoration(
                                    fillColor: Color(0xffCCCCCC),
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: "Email",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xff0C3B2E),
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xff0C3B2E),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xff0C3B2E)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12, bottom: 10, top: 10),
                                child: Text(
                                  "Username",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              TextFormField(
                                enabled: false,
                                controller: controller.usernameController,
                                style: const TextStyle(
                                    color: Color(0xff5B5B5B), fontSize: 12),
                                decoration: const InputDecoration(
                                    fillColor: Color(0xffCCCCCC),
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: "Username",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xff0C3B2E),
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xff0C3B2E),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xff0C3B2E)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12, bottom: 10, top: 10),
                                child: Text(
                                  "Whatsapp",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              TextFormField(
                                controller: controller.whatsappController,
                                style: const TextStyle(
                                    color: Color(0xff5B5B5B), fontSize: 12),
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: "Whatsapp",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xff0C3B2E),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xff0C3B2E)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12, bottom: 10, top: 10),
                                child: Text(
                                  "Password",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              TextFormField(
                                controller: controller.passwordController,
                                style: const TextStyle(
                                    color: Color(0xff5B5B5B), fontSize: 12),
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: "Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xff0C3B2E),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xff0C3B2E)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12, bottom: 10, top: 10),
                                child: Text(
                                  "Konfirmasi Password",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              TextFormField(
                                controller:
                                    controller.confirmationPasswordController,
                                validator: controller.validator,
                                style: const TextStyle(
                                    color: Color(0xff5B5B5B), fontSize: 12),
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: "Konfirmasi Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                        color: Color(0xff0C3B2E),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xff0C3B2E)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffFF5D5D)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.editProfile();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0C3B2E),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text("Simpan")),
                )
              ],
            ),
          ),
        ));
  }
}
