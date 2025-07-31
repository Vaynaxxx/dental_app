import 'package:flutter/material.dart';

class SalaryTab extends StatelessWidget {
  const SalaryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Здесь будет отображаться информация о зарплате сотрудников
    return Center(
      child: Text(
        'Зарплаты сотрудников',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}