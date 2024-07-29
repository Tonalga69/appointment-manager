import 'package:appointments/dashboard.dart';
import 'package:appointments/entities/global_repositories/object_box_repository.dart';
import 'package:appointments/pages/appointments_page/new_appointment_page.dart';
import 'package:appointments/pages/clients_page/new_client_page.dart';
import 'package:appointments/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = Get.put(ObjectBoxRepository());
  await controller.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: [
          GetPage(name: Routes.newClient, page: () => AddClientPage()),
          GetPage(name: Routes.HOME, page: () => DashBoardPage()),
          GetPage(name: Routes.newAppointment, page: () =>  NewAppointmentPage()),
        ],
        title: "Manegador de citas",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DashBoardPage());
  }
}
