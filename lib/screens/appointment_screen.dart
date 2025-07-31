import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String? selectedDoctor;
  DateTime? selectedDate;
  String? selectedTime;
  TextEditingController commentController = TextEditingController();
  String? phoneNumber;
  List<String> availableDoctors = ['Иванов И.И.', 'Петрова С.С.', 'Смирнов А.А.'];
  List<String> availableTimes = [
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '14:00',
    '15:00',
    '16:00',
  ];

  @override
  void initState() {
    super.initState();
    _loadPhoneNumber();
  }

  Future<void> _loadPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = prefs.getString('phoneNumber');
    });
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _submitAppointment() {
    if (selectedDoctor == null || selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, заполните все поля')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Запись подтверждена'),
        content: Text(
          'Доктор: $selectedDoctor\nДата: ${selectedDate!.toLocal().toString().split(' ')[0]}\nВремя: $selectedTime\nТелефон: $phoneNumber\nКомментарий: ${commentController.text}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ОК'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Запись на приём'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Выберите врача:'),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedDoctor,
              hint: Text('Выберите врача'),
              onChanged: (value) {
                setState(() {
                  selectedDoctor = value;
                });
              },
              items: availableDoctors
                  .map((doctor) => DropdownMenuItem(
                        value: doctor,
                        child: Text(doctor),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text('Выберите дату:'),
            ListTile(
              title: Text(selectedDate == null
                  ? 'Не выбрана'
                  : '${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}'),
              trailing: Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            SizedBox(height: 16),
            Text('Выберите время:'),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedTime,
              hint: Text('Выберите время'),
              onChanged: (value) {
                setState(() {
                  selectedTime = value;
                });
              },
              items: availableTimes
                  .map((time) => DropdownMenuItem(
                        value: time,
                        child: Text(time),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text('Ваш телефон: ${phoneNumber ?? "не указан"}'),
            SizedBox(height: 16),
            TextField(
              controller: commentController,
              decoration: InputDecoration(
                labelText: 'Комментарий (необязательно)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitAppointment,
              child: Text('Подтвердить запись'),
            ),
          ],
        ),
      ),
    );
  }
}