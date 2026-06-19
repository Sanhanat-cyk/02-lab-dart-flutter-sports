// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// แก้ไข import path ให้ถูกต้อง
import 'package:my_sports_app/main.dart'; // <<<<<<<<<<<<<<<< แก้ไขตรงนี้!

void main() {
  // เนื่องจากโค้ดทดสอบนี้เป็นของแอป Counter เก่า
  // คุณสามารถลบมันทิ้งไปก่อนได้ หรือจะเขียนโค้ดทดสอบใหม่สำหรับแอปของคุณในอนาคต
  // สำหรับตอนนี้ ผมแนะนำให้ลบออกไปก่อน เพื่อให้แอปสามารถรันได้โดยไม่มีปัญหาจาก Test
  testWidgets('App starts and shows Athletes title',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed (assuming it's "Athletes" or "นักกีฬา")
    // Note: This test relies on the default language (English in this case, "Athletes")
    // For a more robust test, you might need to mock localization.
    expect(find.text('Athletes'),
        findsOneWidget); // ตรวจสอบว่ามีข้อความ "Athletes"
    expect(
        find.byIcon(Icons.add), findsOneWidget); // ตรวจสอบว่ามีปุ่มเพิ่มนักกีฬา
    expect(
        find.byIcon(Icons.brightness_4), findsOneWidget); // ตรวจสอบปุ่มสลับธีม
    expect(find.byIcon(Icons.language), findsOneWidget); // ตรวจสอบปุ่มภาษา
  });
}
