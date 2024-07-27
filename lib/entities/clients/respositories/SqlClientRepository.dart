import 'package:get/get.dart';


class Sqlclientrepository extends GetxController {


  static Sqlclientrepository get to {
    try {
      return Get.find<Sqlclientrepository>();
    } catch (e) {
      return Get.put(Sqlclientrepository());
    }
  }


}
