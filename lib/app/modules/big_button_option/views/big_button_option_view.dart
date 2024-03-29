import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:tawaj/app/data/models/big_button.dart';

import '../controllers/big_button_option_controller.dart';
import 'package:tawaj/app/data/constants/constants.dart' as constans;

class BigButtonOptionView extends GetView<BigButtonOptionController> {
  const BigButtonOptionView({Key? key}) : super(key: key);
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
            const Expanded(
              child: Text(
                "List big button",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff0C3A2D),
      ),
      body: Container(
        child: FutureBuilder<List<BigButtonModel>>(
          future: controller.getBigButton(),
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
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                BigButtonModel bigButton = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    controller.redirectClick(bigButton.link!, bigButton.linkType!);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      color: index % 2 == 0 ? const Color.fromARGB(255, 224, 224, 224) : Colors.white,
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1)),
                            child: Image(
                              image: NetworkImage("${constans.BASE_URL_API}${bigButton.image}"),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bigButton.title!.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                                Text(
                                  bigButton.isShowed == "1" || bigButton.isShowed == 1 ? "Sedang Aktif" : "Sedang tidak aktif",
                                  style: const TextStyle(
                                    fontSize: 12
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
