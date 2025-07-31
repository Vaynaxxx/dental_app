import 'package:flutter/material.dart';

class Service {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Service({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ServicesScreen extends StatelessWidget {
  final List<Service> services = [
    Service(
      name: 'Пломбирование зубов',
      description: 'Восстановление зуба при помощи современной пломбы.',
      price: 3500.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Service(
      name: 'Удаление зуба',
      description: 'Быстрое и безболезненное удаление зуба.',
      price: 4500.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Service(
      name: 'Профессиональная чистка',
      description: 'Удаление налета, камня и отбеливание зубов.',
      price: 2500.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    // Добавь больше услуг при необходимости
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Услуги клиники'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    service.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Text(
                        service.description,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Цена: ${service.price.toStringAsFixed(0)}₽',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/appointment');
                          },
                          child: Text('Записаться'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}