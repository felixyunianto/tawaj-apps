import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tawaj/app/data/models/highlight.dart';
import 'package:tawaj/app/modules/home/controllers/home_controller.dart';
import 'package:tawaj/app/routes/app_pages.dart';
import 'package:tawaj/app/data/constants/constants.dart' as constans;
import 'package:get/get.dart';

class Highlight extends GetView<HomeController> {
  final int indexSort;

  const Highlight({
    Key? key,
    required this.indexSort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<HighlightModel>>(
        future: controller.getHighlight(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          print(snapshot.data!.length);
          if (snapshot.data!.length == 0) {
            return Container(
              height: 177,
              child: Center(child: Text("Tidak ada data")),
            );
          }

          List<HighlightModel> highlights = snapshot.data!;

          return CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: 177,
              disableCenter: true,
            ),
            items: highlights.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      _launchURL(item.link, item.linkType);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      child: Container(
                        height: 177,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(item.images),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(16)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 2),
                                        color: Colors.black12,
                                        blurRadius: 2)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.title,
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(item.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 10,
                                          )),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        });
  }
}

_launchURL(String url, String linkType) async {
  if (linkType == constans.ARTICLE_LINK_TYPE) {
    Get.toNamed(Routes.ARTICLE, arguments: url);
  }else if(linkType == constans.CONTENT_LINK_TYPE){
    Get.toNamed(Routes.CONTENT, arguments: int.parse(url));
  }else{
    Get.toNamed(Routes.BUTTON_PAGES, arguments: int.parse(url));
  }
}
