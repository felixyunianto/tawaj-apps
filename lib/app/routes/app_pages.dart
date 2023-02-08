import 'package:get/get.dart';

import '../modules/article/bindings/article_binding.dart';
import '../modules/article/views/article_view.dart';
import '../modules/button_pages/bindings/button_pages_binding.dart';
import '../modules/button_pages/views/button_pages_view.dart';
import '../modules/content/bindings/content_binding.dart';
import '../modules/content/views/content_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/layout/bindings/layout_binding.dart';
import '../modules/layout/views/layout_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splach_screen/bindings/splach_screen_binding.dart';
import '../modules/splach_screen/views/splach_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLACH_SCREEN,
      page: () => const SplachScreenView(),
      binding: SplachScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => const LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.BUTTON_PAGES,
      page: () => ButtonPagesView(),
      binding: ButtonPagesBinding(),
    ),
    GetPage(
      name: _Paths.CONTENT,
      page: () => ContentView(),
      binding: ContentBinding(),
    ),
  ];
}
