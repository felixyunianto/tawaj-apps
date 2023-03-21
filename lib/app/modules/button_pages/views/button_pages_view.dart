import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/button_page.dart';

import '../controllers/button_pages_controller.dart';

class ButtonPagesView extends GetView<ButtonPagesController> {
  final int buttonPageId = Get.arguments;

  ButtonPagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Obx((() => Text(
                controller.title.value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ))),
          centerTitle: true,
          backgroundColor: Color(0xff0C3A2D),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: FutureBuilder<List<ButtonPage>>(
            future: controller.getButtonPages(buttonPageId.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return RefreshIndicator(
                onRefresh: () {
                  return controller.getButtonPages(buttonPageId.toString());
                },
                child: Container(
                  height: size.height,
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      ButtonPage buttonPages = snapshot.data![index];
                      var child = buttonPages.children;
                      if (child != null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.redirectClick(
                                    buttonPages.link, buttonPages.linkType);
                              },
                              child: Text(
                                buttonPages.title,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ignore: unused_local_variable
                                for (int i = 0; i < child.length; i++)
                                  if (child[i].children!.isNotEmpty)
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 24, left: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            child[i].title,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          for (int l = 0;
                                              l < child[i].children!.length;
                                              l++)
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 12),
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.redirectClick(
                                                      child[i].link,
                                                      child[i].linkType);
                                                },
                                                child: Text(
                                                  child[i].children![l].title,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    )
                                  else
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 24, left: 12),
                                      child: GestureDetector(
                                          onTap: () {
                                            controller.redirectClick(
                                                child[i].link,
                                                child[i].linkType);
                                          },
                                          child: Text(
                                            child[i].title,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )
                              ],
                            )
                          ],
                        );
                      }
                      return Text(buttonPages.title);
                    },
                  ),
                ),
              );
            },
          ),
        ));
  }
}
