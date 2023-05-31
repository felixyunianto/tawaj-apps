import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tawaj/app/data/models/notification.dart';

import '../controllers/notification_controller.dart';

import 'package:tawaj/app/data/constants/constants.dart' as constans;

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
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
                "Notifikasi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff0C3A2D),
      ),
      body: Container(
        child: FutureBuilder<List<NotificationModel>>(
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
                NotificationModel bigButton = snapshot.data![index];
                return GestureDetector(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      color: index % 2 == 0 ? const Color.fromARGB(255, 224, 224, 224) : Colors.white,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
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
                            height: 45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bigButton.title!.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),
                                ),
                                Text(
                                  bigButton.text ?? "",
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
