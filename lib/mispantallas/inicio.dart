import 'package:flutter/material.dart';
import '../main.dart'; // Importante para usar los colores globales

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Texto superior informativo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
              child: const Text(
                'Details on Listings',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            
            // 2. AppBar Guinda con menú circular
            _crearAppBar('Tinta y Hojas', context, false),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Obra Seleccionada',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    // RECUADROS EN VERTICAL (Edición y Precio)
                    _cajaInfoVertical("Edición 2026"),
                    const SizedBox(height: 10),
                    _cajaInfoVertical("\$ 250.00 MXN"),
                    
                    const SizedBox(height: 25),
                    const Text(
                      'Reseña Editorial',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    
                    // CONTENEDOR PRINCIPAL CON PORTADA Y REVIEWS
                    _contenedorDiseno(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: fondoCrema, 
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://raw.githubusercontent.com/Ivett02/imagenes-para-flutter-6J-11-febrero-2026/refs/heads/main/libro44.jpg', 
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => 
                                   const Icon(Icons.auto_stories, size: 70, color: colorVino),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Sinopsis:",
                            style: TextStyle(fontWeight: FontWeight.bold, color: colorVino),
                          ),
                          const Text(
                            "Una narrativa premium curada por Ailin Gallegos (6J). Una pieza imprescindible para tu colección personal.",
                            style: TextStyle(fontSize: 14, height: 1.4),
                          ),
                          const SizedBox(height: 20),
                          
                          // SECCIÓN DE REVIEWS (Foto GitHub + Estrellas + Reseña)
                          _seccionReviewsCompleta(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // Botón de acción principal
                    _botonBase(
                      'ADQUIRIR AHORA',
                      () => Navigator.pushNamed(context, '/reserva'),
                    ),
                    
                    const SizedBox(height: 25),
                    
                    // Firma de Identificación (Tu ID 0494)
                    const Center(
                      child: Text(
                        'Ailin Gallegos - 0494', 
                        style: TextStyle(fontWeight: FontWeight.bold, color: colorVino, fontSize: 16),
                      ),
                    ),
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

  // WIDGET DE REVIEWS (Corregido con NetworkImage)
  Widget _seccionReviewsCompleta() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colorVino, 
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. FOTO DE PERFIL DESDE GITHUB
          const CircleAvatar(
            radius: 25,
            backgroundColor: fondoCrema,
            backgroundImage: NetworkImage(
              'https://raw.githubusercontent.com/Ivett02/imagenes-para-flutter-6J-11-febrero-2026/refs/heads/main/persona.jpg',
            ),
          ),
          const SizedBox(width: 15),
          
          // 2. CONTENIDO DE LA RESEÑA
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lector Verificado - María G.',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 5),
                // Estrellas doradas
                Row(
                  children: List.generate(5, (index) => const Icon(
                    Icons.star, 
                    color: Colors.amber, 
                    size: 16
                  )),
                ),
                const SizedBox(height: 8),
                const Text(
                  '"¡Una historia cautivadora! La edición de 2026 es hermosa. Super recomendado."',
                  style: TextStyle(
                    color: Colors.white70, 
                    fontSize: 12, 
                    height: 1.3, 
                    fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cajaInfoVertical(String texto) {
    return Container(
      width: 180, 
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12), 
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.5), 
        borderRadius: BorderRadius.circular(8)
      ), 
      child: Text(
        texto, 
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)
      ),
    );
  }
}

// --- HELPERS VISUALES ---

Widget _crearAppBar(String t, BuildContext context, bool back) {
  return Container(
    height: 70, color: colorVino, padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(children: [
      if (back) IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18), onPressed: () => Navigator.pop(context)),
      Text(t, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
      const Spacer(),
      Container(
        padding: const EdgeInsets.all(8), 
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), 
        child: const Icon(Icons.menu, color: colorVino, size: 20)
      ),
    ]),
  );
}

Widget _contenedorDiseno(Widget child) {
  return Container(
    padding: const EdgeInsets.all(15), 
    decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(12)), 
    child: child
  );
}

Widget _botonBase(String t, VoidCallback f) {
  return ElevatedButton(
    onPressed: f, 
    style: ElevatedButton.styleFrom(
      backgroundColor: colorVino, 
      minimumSize: const Size(double.infinity, 60), 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    ), 
    child: Text(t, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
  );
}