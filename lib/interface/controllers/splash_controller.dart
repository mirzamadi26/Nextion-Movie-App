import 'dart:async';

import 'package:get/get.dart';
import 'package:movie_app/interface/controllers/watch_controller.dart';
import '../views/home_view.dart';

class SplashController extends GetxController {
  Rx<bool> isInternetAvailable = false.obs;
  final watchViewController = Get.put(WatchViewController());

  @override
  void onReady() async {
    super.onReady();
    Timer(const Duration(seconds: 1), () {
      Get.to(() => const HomeView());
    });
  }
}
