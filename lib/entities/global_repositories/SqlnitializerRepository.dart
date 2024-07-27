import 'package:appointments/entities/clients/Model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class Sqlnitializerrepository extends GetxController {
  static Sqlnitializerrepository get to {
    try {
      return Get.find<Sqlnitializerrepository>();
    } catch (e) {
      return Get.put(Sqlnitializerrepository());
    }
  }

  late final Database db;

  @override
  void onInit() {
    openDatabase("database.db", version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          """${ClientTable.table} 
              """);
    }).then((value) {
      db = value;
    });
    super.onInit();
  }
}
