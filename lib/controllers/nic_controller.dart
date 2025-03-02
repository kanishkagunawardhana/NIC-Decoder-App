import 'package:get/get.dart';
import '../../models/nic_decoder.dart';

class NICController extends GetxController {
  var nic = "".obs;
  var result = {}.obs;

  void decodeNIC() {
    if (nic.value.isNotEmpty) {
      result.value = NICDecoder.decode(nic.value);
      Get.toNamed('/result');
    }
  }
}
