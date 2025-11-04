import 'package:flutter/material.dart';

class SmoothieTile extends StatelessWidget {
  final String smoothieFlavor;
  final String smoothiePrice; 
  final dynamic smoothieColor;
  final String smoothieImagePath;
  final String smoothieProvider;
  final Function(String, double, String) onAddToCart;

  const SmoothieTile ({super.key, required this.smoothieFlavor, required this.smoothiePrice, required this.smoothieColor, required this.smoothieImagePath, required this.smoothieProvider, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(color: smoothieColor[50],borderRadius: BorderRadius.circular(24),),
        
        child: Column(
          children: [
            //Precio
            Row(
              //pone a la derecha el precio 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: smoothieColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24), 
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text("\$$smoothiePrice", style: TextStyle(
                    color: smoothieColor[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                )
              ],
            ),
                //imagen del smoothie
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Image.asset(
                  smoothieImagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
                //Nombre del smoothie
            Text(
              smoothieFlavor, 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            //Proveedor del smoothie
            Text(smoothieProvider, style: TextStyle(color: Colors.grey[600])),
                //botón de agregar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //favorito
                    IconButton(
                      icon: Icon(Icons.favorite), 
                      onPressed: (){},
                      color: Colors.red   
                      ),
                    //agregar
                    TextButton(onPressed: (){
                      onAddToCart(smoothieFlavor, double.parse(smoothiePrice), smoothieImagePath);
                    }, 
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.black
                      ),
                      ))
                  ],
                )
          ],
      
        ),
      ),
    );
  }
}

