import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? phone;

  @override
  void initState() {
    super.initState();
    loadPhone();
  }

  Future<void> loadPhone() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('phone') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добро пожаловать!'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Приветствие
          Text(
            'Здравствуйте${phone != null && phone!.isNotEmpty ? ', $phone' : ''} 👋',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Баннер / изображение
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/clinic_banner.jpg',
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Быстрые действия
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildQuickAccess(
                icon: Icons.calendar_today,
                label: 'Записаться',
                onTap: () => Navigator.pushNamed(context, '/appointment'),
              ),
              _buildQuickAccess(
                icon: Icons.medical_services,
                label: 'Услуги',
                onTap: () => Navigator.pushNamed(context, '/services'),
              ),
              _buildQuickAccess(
                icon: Icons.info_outline,
                label: 'О клинике',
                onTap: () => Navigator.pushNamed(context, '/about'),
              ),
              _buildQuickAccess(
                icon: Icons.person,
                label: 'Профиль',
                onTap: () => Navigator.pushNamed(context, '/profile'),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Новости / акции
          const Text(
            'Новости и акции',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          _buildPromoCard(
            title: 'Скидка 20% на чистку зубов!',
            subtitle: 'Только до конца месяца.',
          ),
          _buildPromoCard(
            title: 'Консультация бесплатна',
            subtitle: 'Для новых клиентов.',
          ),

          const SizedBox(height: 30),

          // Контакты и время работы
          const Text(
            'Контакты',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Text('📍 Ул. Улыбки, 12, г. Зубовск'),
          const Text('📞 +7 (999) 123-45-67'),
          const Text('🕒 Пн–Сб: 9:00 – 20:00'),
        ],
      ),
    );
  }

  Widget _buildQuickAccess({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width - 52) / 2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.teal.shade100),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.teal),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCard({required String title, required String subtitle}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.local_offer, color: Colors.teal),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}