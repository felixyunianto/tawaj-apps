import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawaj/app/data/models/big_button.dart';
import 'package:tawaj/app/modules/home/controllers/home_controller.dart';
import 'package:tawaj/app/routes/app_pages.dart';

class BigButton extends GetView<HomeController> {
  final int indexSort;

  const BigButton({
    Key? key,
    required this.indexSort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<BigButtonModel>>(
        future: controller.getBigButton(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Center(child: const Text("Tidak ada data"));
          }
          List<BigButtonModel> big_buttons = snapshot.data!;
          return Container(
            margin: EdgeInsets.only(bottom: indexSort == 1 ? 24 : 0),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  width: indexSort == 1 ? 3.0 : 0, color: Color(0xffF5F5F5)),
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: SizedBox(
                height: 160,
                child: GridView.builder(
                    itemCount: big_buttons.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (_, index) {
                      if (index == big_buttons.length) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.redirectClick(
                                    big_buttons[index].link!,
                                    big_buttons[index].linkType!);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff6D9773),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                height: 56,
                                width: 56,
                                child: const Icon(
                                  Icons.category_outlined,
                                  size: 36,
                                  color: Color(0xff6D9773),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text("Lainnya",
                                style: TextStyle(
                                  fontSize: 10,
                                ))
                          ],
                        );
                      }
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.redirectClick(big_buttons[index].link!,
                                  big_buttons[index].linkType!);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff6D9773),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 56,
                              width: 56,
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 36,
                                width: 36,
                                child: ClipRRect(
                                  child: Image.network(
                                    big_buttons[index].image!,
                                    height: 36,
                                    width: 36,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(big_buttons[index].title ?? "Error",
                              style: TextStyle(
                                fontSize: 10,
                              ))
                        ],
                      );
                    }),
              ),
            ),
          );
        }));
  }
}
