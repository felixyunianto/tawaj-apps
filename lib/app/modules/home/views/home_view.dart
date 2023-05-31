import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/sort_model.dart';
import 'package:tawaj/app/modules/home/components/big_button.dart';
import 'package:tawaj/app/modules/home/components/big_tab.dart';
import 'package:tawaj/app/modules/home/components/header.dart';
import 'package:tawaj/app/modules/home/components/highlight.dart';
import 'package:tawaj/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.SEARCH);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Icon(
                  Icons.search,
                  color: Color(0xff808080),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xff0C3B2E),
        actions: [
          Visibility(
            visible: controller.getStorage.read("isLogin") != null ? true : false,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Color(0xff0C3B2E),
                    ),
                    onPressed: () {
                      controller.redirectNotification();
                    })),
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                    icon: const Icon(
                      Icons.person_outline,
                      color: Color(0xff0C3B2E),
                    ),
                    onPressed: () {})),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 24, bottom: 10),
        child: FutureBuilder<List<Sort>>(
            future: controller.getSort(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(child: const Text("Tidk ada data"));
              }

              return ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Sort sort = snapshot.data![index];

                  return sort.code == "HIGHLIGHT"
                      ? Highlight(
                          indexSort: index,
                        )
                      : sort.code == "BIG_BUTTON"
                          ? BigButton(indexSort: index)
                          : Container(
                              child: BigTab(),
                            );
                },
              );
            }),
      ),
    );
  }
}
