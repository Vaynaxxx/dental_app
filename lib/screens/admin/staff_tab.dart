import 'package:flutter/material.dart';

class StaffTab extends StatelessWidget {
  const StaffTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Здесь будет отображаться список сотрудников с ролями и обязанностями
    return Center(
      child: Text(
        'Сотрудники и роли',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}