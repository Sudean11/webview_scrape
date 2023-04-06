import 'package:get/get.dart';

class CabDataController extends GetxController {
  var olaAutoValue = 'Ola scraping ...'.obs;
  var uberAutoValue = 'Uber scraping ...'.obs;

  setOlaValue(String value) {
    olaAutoValue.value = value;
  }

  setUberValue(String value) {
    uberAutoValue.value = value;
  }
}
