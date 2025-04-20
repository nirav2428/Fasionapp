import 'package:fashion_app/services/api_service.dart';
import 'package:fashion_app/viewmodels/category_viewmodel.dart';
import 'package:fashion_app/viewmodels/home_viewmodel.dart';
import 'package:fashion_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel(apiService)),
        ChangeNotifierProvider(
          create: (context) => CategoryViewModel(apiService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomePage(),
    );
  }
}
