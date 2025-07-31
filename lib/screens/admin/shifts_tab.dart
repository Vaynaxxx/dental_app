import 'package:flutter/material.dart';

class ShiftsTab extends StatelessWidget {
  const ShiftsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Здесь можно отобразить список смен сотрудников
    return Center(
      child: Text(
        'Смены сотрудников',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}