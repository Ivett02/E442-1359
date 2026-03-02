import 'package:flutter/material.dart';
import '../main.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Texto superior de la pantalla
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
              child: const Text('Payments', style: TextStyle(fontSize: 14, color: Colors.black54)),
            ),
            
            // AppBar Personalizado
            _buildAppBar('Payment', context),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    // --- SECCIÓN DE FOTO DE PERFIL ---
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: fondoCrema,
                      // CAMBIA EL LINK DE ABAJO POR TU IMAGEN DE GITHUB
                      backgroundImage: const NetworkImage(
                        'https://raw.githubusercontent.com/Ivett02/imagenes-para-flutter-6J-11-febrero-2026/refs/heads/main/persona.jpg'
                      ),
                      // Icono de respaldo por si el link falla
                      child: const Icon(Icons.person, size: 50, color: colorVino),
                    ),
                    const SizedBox(height: 15),
                    
                    // Recuadro Profile Info
                    _recuadroSimple("Profile Info"),
                    const SizedBox(height: 12),
                    
                    // Botón Sign In con raya abajo (estilo dibujo)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: const BoxDecoration(
                        color: fondoCrema,
                        border: Border(bottom: BorderSide(color: Colors.black, width: 2))
                      ),
                      child: const Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    
                    const SizedBox(height: 35),
                    
                    // --- SECCIÓN PAYMENT INFO ---
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: const Text("Payment Info", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    
                    // CUADRO DE FORMULARIO (Igual al dibujo)
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Column(
                        children: [
                          _campoTexto("Name"),
                          _campoTexto("**** **** **** 2410"),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(child: _campoTexto("Expira")),
                              const SizedBox(width: 10),
                              Expanded(child: _campoTexto("CVC")),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(child: _campoTexto("USA")),
                              const SizedBox(width: 10),
                              Expanded(child: _campoTexto("20145")),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // BOTÓN MAKE PAYMENT (Largo y con borde)
                    GestureDetector(
                      onTap: () {
                        print("Pago procesado");
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          color: colorVino,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 1)
                        ),
                        child: const Center(
                          child: Text(
                            'Make Payment', 
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 25),
                    // Tu Identificación
                    const Text('Ailin Gallegos - 0494', style: TextStyle(fontWeight: FontWeight.bold, color: colorVino)),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- COMPONENTES VISUALES ---

  Widget _buildAppBar(String t, BuildContext context) {
    return Container(
      height: 65,
      color: colorVino,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(t, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w400)),
          const Spacer(),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            child: Icon(Icons.menu, color: colorVino, size: 20),
          )
        ],
      ),
    );
  }

  Widget _campoTexto(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
      ),
      child: Text(label, style: const TextStyle(color: Colors.black54, fontSize: 13)),
    );
  }

  Widget _recuadroSimple(String texto) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text(texto, style: const TextStyle(fontSize: 14)),
    );
  }
}