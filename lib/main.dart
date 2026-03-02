import 'package:flutter/material.dart';
import 'mispantallas/inicio.dart';
import 'mispantallas/pantalla2.dart';
import 'mispantallas/pantalla3.dart';

void main() {
  runApp(const TintaYHojasApp());
}

class TintaYHojasApp extends StatelessWidget {
  const TintaYHojasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tinta & Hojas',
      theme: ThemeData(fontFamily: 'serif'),
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/reserva': (context) => const Pantalla2(),
        '/pago': (context) => const Pantalla3(),
      },
    );
  }
}

// Colores base del negocio
const Color colorVino = Color(0xFF670010);
const Color fondoCrema = Color(0xFFFDF5E6);