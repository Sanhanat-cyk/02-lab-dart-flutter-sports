// lib/models/athlete.dart
import 'package:intl/intl.dart'; // สำหรับการจัดรูปแบบวันที่

class Athlete {
  String id; // รหัสเฉพาะของนักกีฬา
  String name; // ชื่อนักกีฬา
  double weight; // น้ำหนัก (หน่วยกิโลกรัม)
  double height; // ส่วนสูง (หน่วยเซนติเมตร)
  DateTime dateOfBirth; // วันเกิด
  List<PerformanceRecord> performanceRecords; // สถิติการว่ายน้ำ

  Athlete({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.dateOfBirth,
    this.performanceRecords = const [],
  });

  // Helper เพื่อแสดงอายุ (สามารถคำนวณได้)
  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  // Helper เพื่อแสดงข้อมูลนักกีฬาแบบเป็น String
  @override
  String toString() {
    return 'ID: $id, Name: $name, Weight: $weight kg, Height: $height cm, Age: $age, Records: ${performanceRecords.length}';
  }
}

class PerformanceRecord {
  DateTime date; // วันที่บันทึกสถิติ
  String strokeType; // ประเภทท่าว่าย (เช่น Freestyle, Breaststroke)
  int distance; // ระยะทาง (เมตร)
  Duration time; // เวลาที่ทำได้

  PerformanceRecord({
    required this.date,
    required this.strokeType,
    required this.distance,
    required this.time,
  });

  // Helper เพื่อแสดงเวลาในรูปแบบที่อ่านง่าย
  String get formattedTime {
    final minutes = time.inMinutes.remainder(60);
    final seconds = time.inSeconds.remainder(60);
    final milliseconds = time.inMilliseconds.remainder(1000);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${milliseconds.toString().padLeft(3, '0')}';
  }

  // Helper เพื่อแสดงข้อมูลสถิติ
  @override
  String toString() {
    return '${DateFormat('yyyy-MM-dd').format(date)}: $strokeType - ${distance}m in $formattedTime';
  }
}
