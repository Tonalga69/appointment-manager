

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../entities/appointments/appointmentsModel.dart';

class AppointmentsItem extends StatelessWidget {
  const AppointmentsItem({super.key, required this.appointment});
  final Appointmentsmodel appointment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(appointment.client.target!.name),
      subtitle: FutureBuilder(
        future: Jiffy.setLocale("es"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text(Jiffy.parse(appointment.date.toIso8601String()).yMMMMEEEEdjm);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
