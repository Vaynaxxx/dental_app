import 'package:flutter/material.dart';

class DisciplineTab extends StatelessWidget {
  const DisciplineTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Здесь будет отображаться информация о дисциплинарных нарушениях
    return Center(
      child: Text(
        'Дисциплинарные нарушения',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}