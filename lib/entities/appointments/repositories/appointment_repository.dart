import 'package:appointments/entities/appointments/appointmentsModel.dart';
import 'package:appointments/entities/global_repositories/object_box_repository.dart';
import 'package:appointments/objectbox.g.dart';
import 'package:get/get.dart';

class AppointmentRepository extends GetxController {
  final store = ObjectBoxRepository.to.store;
  static AppointmentRepository get to {
    try {
      return Get.find<AppointmentRepository>();
    } catch (e) {
      return Get.put(AppointmentRepository());
    }
  }

  void addAppointment(Appointmentsmodel appointment) {
    store.box<Appointmentsmodel>().put(appointment);

  }

  Future<List<Appointmentsmodel>> getAllAppointments({DateTime? initDate}) async {
    if (initDate == null) {
      return store.box<Appointmentsmodel>().getAll()..sort((a, b) => a.date.compareTo(b.date));
    }
    return store.box<Appointmentsmodel>().query(Appointmentsmodel_.date.greaterOrEqualDate(initDate)).build().find()..sort((a, b) => a.date.compareTo(b.date));
  }

 Future<Appointmentsmodel> updateAppointment(Appointmentsmodel model) async {
    final res = await store.box<Appointmentsmodel>().putAndGetAsync(model);
    return res;
  }

  void deleteAppointment(Appointmentsmodel model) {
    store.box<Appointmentsmodel>().remove(model.id);
 }
}
