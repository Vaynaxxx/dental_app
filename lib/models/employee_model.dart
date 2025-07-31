import 'package:hive/hive.dart';

part 'employee_model.g.dart';

@HiveType(typeId: 0)
class Employee extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String role;

  @HiveField(2)
  double salary;

  @HiveField(3)
  int lateCount;

  @HiveField(4)
  bool uniformViolation;

  @HiveField(5)
  bool isAdmin;

  @HiveField(6)
  String phone; // ✅ добавлено

  @HiveField(7)
  String password; // ✅ добавлено

  Employee({
    required this.name,
    required this.role,
    required this.salary,
    required this.phone,        // ✅ добавлено
    required this.password,     // ✅ добавлено
    this.lateCount = 0,
    this.uniformViolation = false,
    this.isAdmin = false,
  });
}