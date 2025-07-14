import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/test_brand_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupGetIt();
  runApp(const TestBrandApp());
}
