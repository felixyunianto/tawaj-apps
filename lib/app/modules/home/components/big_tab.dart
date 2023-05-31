import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tawaj/app/data/models/big_tab.dart';
import 'package:tawaj/app/data/models/sort_model.dart';
import 'package:tawaj/app/modules/home/controllers/home_controller.dart';
import 'package:tawaj/app/data/constants/constants.dart' as constans;

class BigTab extends GetView<HomeController> {
  const BigTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BigTabModel>>(
      future: controller.getBigTabs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.isEmpty) {
          return Container(
              height: 190,
              child: const Center(child: Text("Tidak ada data")),
            );
        }

        return SizedBox(
          height: 190,
          child: ListView.builder(
              primary: true,
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                BigTabModel bigTab = snapshot.data![index];

                // ignore: unrelated_type_equality_checks
                if (bigTab.typeButton == "1" || bigTab.typeButton == 1) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xff0C3B2E)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bigTab.title.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                bigTab.description.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
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
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xffFFBA00),
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ))),
                              onPressed: () {
                                controller.redirectClick(
                                    bigTab.link!, bigTab.linkType!);
                              },
                              child: const Text(
                                "Klik disini",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              )),
                        )
                      ],
                    ),
                  );
                } else {
                  return bigTab.typeButton == "2" || bigTab.typeButton == 2
                      ? GestureDetector(
                          onTap: () {
                            controller.redirectClick(
                                bigTab.link!, bigTab.linkType!);
                          },
                          child: (Container(
                            padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bigTab.title.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  bigTab.description.toString(),
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          )),
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.redirectClick(
                                bigTab.link!, bigTab.linkType!);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xff0C3B2E)),
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage("${constans.BASE_URL_API}${bigTab.image}" ?? "http://cdn.onlinewebfonts.com/svg/img_98811.png"),
                                  height: 32,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  bigTab.title.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                }
              })),
        );
      },
    );
  }
}
