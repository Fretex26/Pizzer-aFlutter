import 'package:flutter/material.dart';
import './pages/login_page.dart';
import './pages/order_page.dart';
import './pages/confirmation_page.dart';

void main() {
  runApp(const PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola Pizza',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 236, 196, 148),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 217, 82, 4),
        ),
      ),
      //debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        '/order': (context) => const OrderPage(),
        '/confirm':(context) => const ConfirmationPage(),
      },
      // home: LoginPage(),
    );
  }
}

