import 'package:get/get.dart';

class CabDataController extends GetxController {
  var olaAutoValue = 'Ola scraping ...'.obs;
  var uberAutoValue = 'Uber scraping ...'.obs;
  var showOlaWebView = false.obs;
  var showUberWebView = false.obs;
  bool? isActive;

  setOlaValue(String value) {
    olaAutoValue.value = value;
  }

  setUberValue(String value) {
    uberAutoValue.value = value;
  }

  void showHomePage() {
    showOlaWebView.value = false;
    showUberWebView.value = false;
  }

  void showOlaView() {
    showOlaWebView.value = true;
    showUberWebView.value = false;
  }

  void showUberView() {
    showOlaWebView.value = false;
    showUberWebView.value = true;
  }
}
