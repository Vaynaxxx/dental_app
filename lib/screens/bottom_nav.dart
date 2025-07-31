import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'appointment_screen.dart';
import 'services_screen.dart';
import 'profile_screen.dart';
import 'about_screen.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    AppointmentScreen(),
    ServicesScreen(),
    AboutScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Запись'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'Услуги'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'О клинике'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}