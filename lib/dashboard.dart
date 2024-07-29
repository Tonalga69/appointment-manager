import 'package:appointments/entities/appointments/controllers/appointments_controller.dart';
import 'package:appointments/entities/clients/controllers/ClientsController.dart';
import 'package:appointments/pages/appointments_page/appointment_pager.dart';
import 'package:appointments/pages/clients_page/clients_pager.dart';
import 'package:appointments/utils/colors.dart';
import 'package:appointments/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatelessWidget {
   DashBoardPage({super.key});
  final ClientsController clientController = Get.put(ClientsController());
  final AppointmentsController appointmentsController = Get.put(AppointmentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: const Text('Manegador de citas',
            style: TextStyle(fontSize: 18, color: AppColors.white)),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: AppColors.blue,
        animatedIcon:  AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(color: AppColors.white),
        overlayColor: AppColors.gray,
        children: [
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.user),
            label: 'Clientes',
            onTap: () {
             Get.toNamed(Routes.newClient);
            },
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.calendar),
            label: 'Citas',
            onTap: () {
              Get.toNamed(Routes.newAppointment);
            },
          ),

        ],
      ),
      body: PageView(
        children: const [
          ClientsPager(),
          AppointmentPager()
        ],
      ),
    );
  }
}
