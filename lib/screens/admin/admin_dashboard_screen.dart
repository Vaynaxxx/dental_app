import 'package:flutter/material.dart';
import 'discipline_tab.dart';
import 'reports_tab.dart';
import 'salary_tab.dart';
import 'shifts_tab.dart';
import 'staff_tab.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const ShiftsTab(),
    const SalaryTab(),
    const DisciplineTab(),
    const StaffTab(),
    const ReportsTab(),
  ];

  final List<String> _titles = [
    'Смены',
    'Зарплаты',
    'Дисциплина',
    'Сотрудники',
    'Отчёты',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex])),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Смены'),
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: 'Зарплаты'),
          BottomNavigationBarItem(icon: Icon(Icons.report_problem), label: 'Дисциплина'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Сотрудники'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Отчёты'),
        ],
      ),
    );
  }
}