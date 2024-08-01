import 'dart:io';

import 'package:appointments/objectbox.g.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxRepository extends GetxController{
  late final Store store;

  Future<void> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    store = Store(getObjectBoxModel(), directory: join(appDocDir.path, 'database'));
  }


  static ObjectBoxRepository get to {
    try {
      return Get.find<ObjectBoxRepository>();
    } catch (e) {
      return Get.put(ObjectBoxRepository());
    }
  }
}