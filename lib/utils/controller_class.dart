import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class ControllerClass extends GetxController {
  RxString flag = Country.parse('IN').flagEmoji.obs;
  RxString countryCode = Country.parse('IN').phoneCode.obs;
  RxInt phoneNumber = 123.obs;
}
