import 'package:appointments/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

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
            child: Icon(FontAwesomeIcons.user),
            label: 'Clientes',
            onTap: () {
              Navigator.pushNamed(context, '/clients');
            },
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.calendar),
            label: 'Citas',
            onTap: () {
              Navigator.pushNamed(context, '/appointments');
            },
          ),

        ],
      ),
      body: const Center(
        child: Text(
          'Clients Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
