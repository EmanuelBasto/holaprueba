import 'package:flutter/material.dart';

class PancakeTile extends StatelessWidget {
  final String pancakeFlavor;
  final String pancakePrice; 
  final dynamic pancakeColor;
  final String pancakeImagePath;
  final String pancakeProvider;
  final Function(String, double, String) onAddToCart;

  const PancakeTile ({super.key, required this.pancakeFlavor, required this.pancakePrice, required this.pancakeColor, required this.pancakeImagePath, required this.pancakeProvider, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(color: pancakeColor[50],borderRadius: BorderRadius.circular(24),),
        
        child: Column(
          children: [
            //Precio
            Row(
              //pone a la derecha el precio 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pancakeColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24), 
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text("\$$pancakePrice", style: TextStyle(
                    color: pancakeColor[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                )
              ],
            ),
                //imagen del pancake
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Image.asset(
                  pancakeImagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
                //Nombre del pancake
            Text(
              pancakeFlavor, 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            //Proveedor del pancake
            Text(pancakeProvider, style: TextStyle(color: Colors.grey[600])),
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
                      onAddToCart(pancakeFlavor, double.parse(pancakePrice), pancakeImagePath);
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

