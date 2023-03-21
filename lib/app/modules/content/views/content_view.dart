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
          PopupMenuButton(
              onSelected: (value) => {
                    if (value == 1)
                      {
                        controller.changeStatusToggleIndo(
                            !controller.statusToggleIndo.value)
                      }
                    else
                      {
                        controller.changeStatusToggleLatin(
                            !controller.statusToggleLatin.value)
                      }
                  },
              itemBuilder: (content) => [
                    PopupMenuItem(
                        value: 1,
                        child: Container(
                          child: Row(
                            children: [
                              FlutterSwitch(
                                width: 35.0,
                                height: 20.0,
                                activeText: "",
                                inactiveText: "",
                                toggleSize: 10.0,
                                padding: 2,
                                toggleColor: Colors.grey,
                                activeToggleColor: Colors.white,
                                activeColor: const Color(0xff6D9773),
                                switchBorder:
                                    Border.all(color: Colors.grey, width: 1),
                                inactiveColor: Colors.transparent,
                                value: controller.statusToggleIndo.value,
                                borderRadius: 30.0,
                                showOnOff: true,
                                onToggle: (val) {},
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text("Terjemahan")
                            ],
                          ),
                        )),
                    PopupMenuItem(
                        value: 2,
                        child: Container(
                          child: Row(
                            children: [
                              FlutterSwitch(
                                width: 35.0,
                                height: 20.0,
                                activeText: "",
                                inactiveText: "",
                                toggleSize: 10.0,
                                padding: 2,
                                toggleColor: Colors.grey,
                                activeToggleColor: Colors.white,
                                activeColor: const Color(0xff6D9773),
                                switchBorder:
                                    Border.all(color: Colors.grey, width: 1),
                                inactiveColor: Colors.transparent,
                                value: controller.statusToggleLatin.value,
                                borderRadius: 30.0,
                                showOnOff: true,
                                onToggle: (val) {},
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text("Latin")
                            ],
                          ),
                        )),
                  ])
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                            SizedBox(width: 12,),
                            Flexible(
                              child: Text(contentElement?.arab ?? "Error",
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontFamily: 'ScheherazadeNew',
                                    fontSize: 14,
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Obx((() => Visibility(
                            visible: controller.statusToggleLatin.value
                                ? true
                                : false,
                            child: Text(
                                contentElement?.latin?.toUpperCase() ?? "-",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ))))),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx((() => Visibility(
                            visible: controller.statusToggleIndo.value
                                ? true
                                : false,
                            child: Text(contentElement?.indo ?? "-",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ))))),
                      ],
                    ));
              }));
        },
      ),
    );
  }
}
