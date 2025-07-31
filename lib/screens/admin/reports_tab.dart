import 'package:flutter/material.dart';

class ReportsTab extends StatelessWidget {
  const ReportsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Здесь будут отображаться отчёты или экспорт данных
    return Center(
      child: Text(
        'Отчёты и статистика',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}