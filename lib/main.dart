import 'package:flutter/material.dart';
import 'package:medicalstore_app/screens/home_screen.dart';

void main() {
  runApp(const MedicalStoreApp());
}

class MedicalStoreApp extends StatelessWidget {
  const MedicalStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Store Inventory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomeScreen(),
    );
  }
}
