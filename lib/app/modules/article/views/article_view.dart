import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  final String? urlPage = Get.arguments;

  ArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: urlPage != null
            ? AppBar(
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
                      child: Text(
                        urlPage ?? "https://google.com",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Color(0xff0C3A2D),
              )
            : null,
        body: WebView(
          initialUrl: urlPage ?? "https://google.com",
        ));
  }
}
