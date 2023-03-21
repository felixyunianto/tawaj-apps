import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/user.dart';
import 'package:tawaj/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<ProfileController>(() => ProfileController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xff0C3B2E),
        centerTitle: false,
      ),
      body: FutureBuilder<User?>(
        future: controller.getProfile(controller.getValue("id")),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          User? user = snapshot.data;

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 43),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                            color: const Color(0xffABABAB),
                            borderRadius: BorderRadius.circular(60)),
                        child: Center(
                          child: Text(
                            user?.name?[0] ?? "",
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Text(
                        user?.name ?? "",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user?.email ?? "",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xffD9D9D9)),
                          top: BorderSide(width: 1, color: Color(0xffD9D9D9)))),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.EDIT_PROFILE);
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.person, size: 16),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Edit Profile",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Row(
                          children: const [
                            Icon(Icons.info, size: 16),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Informasi",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Container(
                          child: Row(
                            children: const [
                              Icon(Icons.notifications, size: 16),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Notifikasi",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: controller.signOut,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: const [
                        Icon(Icons.logout, size: 16),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Keluar",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
