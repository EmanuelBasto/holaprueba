import 'package:flutter/material.dart';

class BurgerTile extends StatelessWidget {
  final String burgerFlavor;
  final String burgerPrice; 
  final dynamic burgerColor;
  final String burgerImagePath;
  final String burgerProvider;
  final Function(String, double, String) onAddToCart;

  const BurgerTile ({super.key, required this.burgerFlavor, required this.burgerPrice, required this.burgerColor, required this.burgerImagePath, required this.burgerProvider, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(color: burgerColor[50],borderRadius: BorderRadius.circular(24),),
        
        child: Column(
          children: [
            //Precio
            Row(
              //pone a la derecha el precio 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: burgerColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24), 
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text("\$$burgerPrice", style: TextStyle(
                    color: burgerColor[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                )
              ],
            ),
                //imagen del burger
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Image.asset(
                  burgerImagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
                //Nombre del burger
            Text(
              burgerFlavor, 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            //Proveedor del burger
            Text(burgerProvider, style: TextStyle(color: Colors.grey[600])),
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
                      onAddToCart(burgerFlavor, double.parse(burgerPrice), burgerImagePath);
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

