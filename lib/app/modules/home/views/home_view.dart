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
          child: SizedBox(
            height: 36,
            child: TextFormField(
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xff808080),
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 36, minHeight: 36),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(90.0)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(fontSize: 12),
                labelStyle: TextStyle(fontSize: 12),
                helperStyle: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xff0C3B2E),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Color(0xff0C3B2E),
                  ),
                  onPressed: () {})),
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
