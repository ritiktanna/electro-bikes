import 'package:get/state_manager.dart';

class ControllerClass extends GetxController {
  var firstIndicator = true.obs;
  var secondIndicator = false.obs;

  void changeValue() {
    firstIndicator.value = !firstIndicator.value;
    secondIndicator.value = !secondIndicator.value;
  }
}
