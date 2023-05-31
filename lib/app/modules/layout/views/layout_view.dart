import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/modules/article/views/article_view.dart';
import 'package:tawaj/app/modules/home/views/home_view.dart';
import 'package:tawaj/app/modules/profile/views/profile_view.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0C3B2E),
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: Container(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [const HomeView(), ArticleView(), ProfileView()],
          ),
        ),
        bottomNavigationBar: FloatingNavbar(
          borderRadius: 12,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          backgroundColor: const Color(0xff0B392C),
          unselectedItemColor: const Color(0xffA5A5A5),
          selectedItemColor: Colors.white,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          selectedBackgroundColor: Colors.transparent,
          items: [
            __bottomNavigationBarItem("Home", Icons.home_filled),
            __bottomNavigationBarItem("Artikel", Icons.article),
            __bottomNavigationBarItem("Profile", Icons.person),
          ],
        ),
      );
    });
  }

  __bottomNavigationBarItem(String title, IconData icon) {
    return FloatingNavbarItem(icon: icon, title: title);
  }
}
