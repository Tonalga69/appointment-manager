import 'package:appointments/entities/appointments/appointmentsModel.dart';
import 'package:appointments/entities/global_repositories/object_box_repository.dart';
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

  Future<List<Appointmentsmodel>> getAllAppointments() async {
    return store.box<Appointmentsmodel>().getAll()..sort((a, b) => a.date.compareTo(b.date));
  }
}
