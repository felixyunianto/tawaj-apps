import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/content.dart' as contentModel;

import '../controllers/content_controller.dart';

class ContentView extends GetView<ContentController> {
  final int contentId = Get.arguments;
  ContentView({Key? key, int? contentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx((() => Text(
          controller.title.value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ))),
        centerTitle: true,
        backgroundColor: Color(0xff0C3A2D),
      ),
      body: FutureBuilder<contentModel.Content>(
        future: controller.getCotentDetail(contentId.toString()),
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
              itemCount: snapshot.data?.content.length ?? 0,
              itemBuilder: ((context, index) {
                contentModel.ContentElement? contentElement =
                    snapshot.data?.content[index];
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                    decoration: BoxDecoration(
                        color:
                            index % 2 == 0 ? Color(0xffF6F6F6) : Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 2,
                              color: Color.fromRGBO(0, 0, 0, 0.25))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(contentElement?.arab ?? "Error",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontFamily: 'ScheherazadeNew',
                                fontSize: 14,
                              )),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(contentElement?.latin ?? "Error",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(contentElement?.indo ?? "Error",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            )),
                      ],
                    ));
              }));
        },
      ),
    );
  }
}
