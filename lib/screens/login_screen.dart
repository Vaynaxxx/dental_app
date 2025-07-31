import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:dental_app/models/employee_model.dart';
import 'package:dental_app/screens/admin/admin_dashboard_screen.dart';
import 'package:dental_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<Employee> employees = [
    Employee(
        name: 'Администратор',
        phone: '0000',
        password: 'admin',
        role: 'admin',
        salary: 0.0),
    Employee(
        name: 'Стоматолог',
        phone: '1111',
        password: 'doc123',
        role: 'dentist',
        salary: 0.0),
    Employee(
        name: 'Санитарка',
        phone: '2222',
        password: 'san123',
        role: 'cleaner',
        salary: 0.0),
    Employee(
        name: 'Управляющий',
        phone: '3333',
        password: 'boss123',
        role: 'manager',
        salary: 0.0),
  ];

  void _login() async {
    String phone = _phoneController.text.trim();
    String password = _passwordController.text.trim();

    Employee? foundEmployee = employees.firstWhere(
      (emp) => emp.phone == phone && emp.password == password,
      orElse: () => Employee(
          name: '',
          phone: '',
          password: '',
          role: '',
          salary: 0.0), // пустой объект
    );

    if (foundEmployee.phone.isNotEmpty) {
      var box = Hive.box<Employee>('employees');
      await box.clear(); // очищаем старую сессию
      await box.put('current', foundEmployee);

      if (foundEmployee.role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminDashboardScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный номер или пароль')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Номер телефона'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}