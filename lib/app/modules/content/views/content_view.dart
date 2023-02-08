import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
        titleSpacing: 8,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 24,
              ),
            ),
            Expanded(
              child: Obx((() => Text(
                    controller.title.value,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))),
            ),
          ],
        ),
        actions: [
          Obx((() => Container(
                margin: EdgeInsets.only(right: 16),
                child: FlutterSwitch(
                  width: 38.0,
                  height: 20.0,
                  activeText: "",
                  inactiveText: "",
                  toggleSize: 16.0,
                  padding: 2,
                  toggleColor: Colors.white,
                  activeColor: Color(0xff6D9773),
                  switchBorder: Border.all(
                    color: Colors.white,
                    width: 1
                  ),
                  inactiveColor: Colors.transparent,
                  value: controller.statusToggle.value,
                  borderRadius: 30.0,
                  showOnOff: true,
                  onToggle: (val) {
                    controller.changeStatusToggle(val);
                  },
                ),
              ))),
        ],
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
                        Obx(() =>  Row(
                          mainAxisAlignment: controller.statusToggle.value ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
                          children: [
                            Obx(() => Visibility(
                              visible: controller.statusToggle.value ? true : false,
                              child: Container(
                                width: 29.0,
                                height: 29.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xffFFBA00),
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      strokeAlign: StrokeAlign.inside),
                                ),
                                child: Center(
                                  child: Text(
                                    ArabicNumbers()
                                        .convert((index + 1).toString()),
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'ScheherazadeNew',
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            Text(contentElement?.arab ?? "Error",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontFamily: 'ScheherazadeNew',
                                  fontSize: 14,
                                ))
                          ],
                        )),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(contentElement?.latin?.toUpperCase() ?? "Error",
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
