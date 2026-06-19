// lib/providers/athlete_provider.dart
import 'package:flutter/foundation.dart';
import '/models/athlete.dart'; // ตรวจสอบ path ให้ถูกต้อง

class AthleteProvider with ChangeNotifier {
  final List<Athlete> _athletes = []; // รายการนักกีฬา

  List<Athlete> get athletes => _athletes; // Getter สำหรับเข้าถึงรายการนักกีฬา

  void addAthlete(Athlete athlete) {
    _athletes.add(athlete);
    notifyListeners(); // แจ้งเตือน Widget ที่ฟังอยู่ให้อัปเดต UI
  }

  void addPerformanceRecord(String athleteId, PerformanceRecord record) {
    final athleteIndex = _athletes.indexWhere((a) => a.id == athleteId);
    if (athleteIndex != -1) {
      _athletes[athleteIndex].performanceRecords = [
        ..._athletes[athleteIndex].performanceRecords, // คัดลอกรายการเดิม
        record, // เพิ่มสถิติใหม่
      ];
      _athletes[athleteIndex]
          .performanceRecords
          .sort((a, b) => b.date.compareTo(a.date)); // เรียงตามวันที่ล่าสุด
      notifyListeners();
    }
  }

  // ตัวอย่างข้อมูลเริ่มต้น (สามารถลบออกได้)
  void initializeDummyData() {
    if (_athletes.isEmpty) {
      addAthlete(
        Athlete(
          id: '1',
          name: 'สมศักดิ์ แข็งแรง',
          weight: 70.5,
          height: 175.0,
          dateOfBirth: DateTime(1995, 5, 10),
          performanceRecords: [
            PerformanceRecord(
              date: DateTime(2025, 5, 20),
              strokeType: 'Freestyle',
              distance: 50,
              time: const Duration(seconds: 28, milliseconds: 500),
            ),
            PerformanceRecord(
              date: DateTime(2025, 5, 15),
              strokeType: 'Breaststroke',
              distance: 100,
              time: const Duration(minutes: 1, seconds: 15, milliseconds: 200),
            ),
          ],
        ),
      );
      addAthlete(
        Athlete(
          id: '2',
          name: 'สมหญิง คล่องแคล่ว',
          weight: 55.0,
          height: 162.0,
          dateOfBirth: DateTime(1998, 8, 22),
          performanceRecords: [
            PerformanceRecord(
              date: DateTime(2025, 5, 25),
              strokeType: 'Backstroke',
              distance: 50,
              time: const Duration(seconds: 32, milliseconds: 100),
            ),
          ],
        ),
      );
    }
  }
}
