import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/sort_model.dart';
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
        margin: EdgeInsets.only(top: 24),
        child: FutureBuilder<List<Sort>>(
            future: controller.getSort(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Center(child: const Text("Tidk ada data"));
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Sort sort = snapshot.data![index];

                  return sort.code == "HIGHLIGHT"
                      ? Highlight(
                          indexSort: index,
                        )
                      : sort.code == "BIG_BUTTON"
                          ? Container(
                              margin:
                                  EdgeInsets.only(bottom: index == 1 ? 24 : 0),
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    width: index == 1 ? 3.0 : 0,
                                    color: Color(0xffF5F5F5)),
                              )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 24),
                                child: SizedBox(
                                  height: 160,
                                  child: GridView(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                      ),
                                      children: List.generate(8, (index) {
                                        return Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed(Routes.CONTENT, arguments: 1);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Color(0xff6D9773),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                height: 56,
                                                width: 56,
                                                child: const Icon(
                                                  Icons.mosque_outlined,
                                                  color: Color(0xff6D9773),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            const Text("Tawajjahut",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ))
                                          ],
                                        );
                                      })),
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  bottom: index == 1 ? 24 : 0),
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    width: index == 1 ? 3.0 : 0,
                                    color: Color(0xffF5F5F5)),
                              )),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                margin: EdgeInsets.fromLTRB(16, 0, 16, 24),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: const Color(0xff0C3B2E)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Donasi Pengembangan Rumah Tahfidz Bersama Palapa (63,2%)",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            "Berkontribusi bersama penghafal Al-Quran di daerah Baker Street",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 24,
                                      child: TextButton(
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 2)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                const Color(0xffFFBA00),
                                              ),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ))),
                                          onPressed: () {},
                                          child: const Text(
                                            "Klik disini",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            );
                },
              );
            }),
      ),
    );
  }
}
