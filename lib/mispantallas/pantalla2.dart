import 'package:flutter/material.dart';
import '../main.dart'; 

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Texto superior
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
              child: const Text('Proceso de Reserva', style: TextStyle(fontSize: 14, color: Colors.black54)),
            ),
            
            // AppBar Guinda
            _buildAppBar('Reservacion', context),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Boton: Configura tu pedido
                    _botonSimple("Configura tu Pedido"),
                    
                    const SizedBox(height: 30),
                    
                    // RECUADRO CON EL BOTON EN LA LINEA (Stack)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // El contenedor del borde
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12, width: 1.5), 
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              const Text("DISPONIBILIDAD", style: TextStyle(fontWeight: FontWeight.bold, color: colorVino)),
                              const SizedBox(height: 20),
                              _bloqueInfo("RECOLECCION EN TIENDA", "Lunes, 02 Mar", "10:00 AM - 8:00 PM"),
                              const SizedBox(height: 20),
                              _bloqueInfo("ENVIO A DOMICILIO", "Sabado, 07 Mar", "Entrega Estimada"),
                            ],
                          ),
                        ),
                        // El boton de Sucursal Valle encima de la linea
                        Positioned(
                          top: -18, // Sube el boton para que quede enmedio de la linea
                          left: 15, // A la izquierda
                          child: _botonSimple("Sucursal Valle"),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    _botonSimple("Opciones de Regalo"),
                    
                    const SizedBox(height: 40),
                    
                    // Boton Final
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/pago'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorVino, 
                        minimumSize: const Size(double.infinity, 60), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      child: const Text('CONTINUAR AL PAGO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    
                    const SizedBox(height: 25),
                    const Center(child: Text('Ailin Gallegos - 0494', style: TextStyle(fontWeight: FontWeight.bold, color: colorVino))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget de boton sin funciones de "pequeño" para evitar errores
  Widget _botonSimple(String texto) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: fondoCrema,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(texto, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(width: 5),
          const Icon(Icons.expand_more, size: 18, color: colorVino),
        ],
      ),
    );
  }

  Widget _buildAppBar(String t, BuildContext context) {
    return Container(
      height: 65, color: colorVino, padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18), onPressed: () => Navigator.pop(context)),
        Text(t, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        const Spacer(),
        const Icon(Icons.menu, color: Colors.white, size: 28),
      ]),
    );
  }

  Widget _bloqueInfo(String titulo, String f, String h) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: fondoCrema, 
            border: Border.all(color: colorVino.withOpacity(0.2)), 
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(children: [
            const Icon(Icons.check_circle, color: colorVino, size: 22),
            const SizedBox(width: 15),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(f, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(h, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ]),
          ]),
        ),
      ],
    );
  }
}