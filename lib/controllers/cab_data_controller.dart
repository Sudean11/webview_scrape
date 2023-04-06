import 'package:get/get.dart';

class CabDataController extends GetxController {
  var olaAutoValue = 'data loading'.obs;

  setOlaValue(String value) {
    olaAutoValue.value = value;
  }
}
