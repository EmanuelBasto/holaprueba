import 'package:flutter/material.dart';

class PizzaTile extends StatelessWidget {
  final String pizzaFlavor;
  final String pizzaPrice; 
  final dynamic pizzaColor;
  final String pizzaImagePath;
  final String pizzaProvider;
  final Function(String, double, String) onAddToCart;

  const PizzaTile ({super.key, required this.pizzaFlavor, required this.pizzaPrice, required this.pizzaColor, required this.pizzaImagePath, required this.pizzaProvider, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(color: pizzaColor[50],borderRadius: BorderRadius.circular(24),),
        
        child: Column(
          children: [
            //Precio
            Row(
              //pone a la derecha el precio 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pizzaColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24), 
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text("\$$pizzaPrice", style: TextStyle(
                    color: pizzaColor[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                )
              ],
            ),
                //imagen de la pizza
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Image.asset(
                  pizzaImagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
                //Nombre de la pizza
            Text(
              pizzaFlavor, 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            //Proveedor de la pizza
            Text(pizzaProvider, style: TextStyle(color: Colors.grey[600])),
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
                      onAddToCart(pizzaFlavor, double.parse(pizzaPrice), pizzaImagePath);
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

