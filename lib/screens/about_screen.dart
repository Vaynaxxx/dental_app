import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О клинике'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              'Стоматологическая клиника «Улыбка+»',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('📍 Адрес: г. Москва, ул. Зубная, д. 12'),
            SizedBox(height: 8),
            Text('☎ Телефон: +7 (495) 123-45-67'),
            SizedBox(height: 8),
            Text('🕒 Время работы: Пн-Сб, 9:00 – 20:00'),
            SizedBox(height: 16),
            Text('🗺 Как добраться:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Метро "Стоматологическая", 5 минут пешком от выхода №2.'),
            SizedBox(height: 24),
            Placeholder(fallbackHeight: 200), // Заглушка для карты
            SizedBox(height: 16),
            Text(
              'Мы предлагаем полный спектр стоматологических услуг: терапия, ортопедия, хирургия, имплантация и гигиена. Добро пожаловать!',
              style: TextStyle(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}