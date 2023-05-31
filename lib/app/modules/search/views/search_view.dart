import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/routes/app_pages.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
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
                  child: Container(
                height: 36,
                margin: EdgeInsets.only(right: 24),
                child: TextFormField(
                  autofocus: true,
                  onFieldSubmitted: (value) {
                    controller.doSearch(value);
                  },
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
              )),
            ],
          ),
          backgroundColor: const Color(0xff0C3A2D),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: Obx(() => ListView.builder(
            itemCount: controller.contents.length == 0
                ? 1
                : controller.contents.length,
            itemBuilder: (BuildContext context, int index) {
              if (controller.contents.value.isEmpty &&
                  controller.search == '') {
                return Container();
              }
              if (controller.contents.value.isEmpty &&
                  controller.search != "") {
                return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Center(child: Text('Data tidak ditemukan')));
              }
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.CONTENT,
                      arguments:
                          int.parse(controller.contents.value[index]['id'].toString()));
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black87, width: 1.0))),
                    child: Text(
                        '${controller.contents.value[index]["title_arab"] ?? controller.contents.value[index]["title_indo"]}')),
              );
            })));
  }
}
