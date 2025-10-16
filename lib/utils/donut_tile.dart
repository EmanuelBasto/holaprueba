import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice; 
  final dynamic donutColor;
  final String donutImagePath;
  final String donutProvider;

  const DonutTile ({super.key, required this.donutFlavor, required this.donutPrice, required this.donutColor, required this.donutImagePath, required this.donutProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(color: donutColor[50],borderRadius: BorderRadius.circular(24),),
        
        child: Column(
          children: [
            //Precio
            Row(
              //pone a la derecha el precio 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: donutColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24), 
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding:  const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text("\$$donutPrice", style: TextStyle(
                    color: donutColor[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                )
              ],
            ),
                //imagen del donut
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Image.asset(donutImagePath),
              ),
                //Nombre del donut
            Text(
              donutFlavor, 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            //Proveedor del donut
            Text(donutProvider, style: TextStyle(color: Colors.grey[600])),
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
                    TextButton(onPressed: (){}, 
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