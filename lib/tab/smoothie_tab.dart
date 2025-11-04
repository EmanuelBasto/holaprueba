import 'package:DONUT_APP_8SC_25_3/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final Function(String, double, String) onAddToCart;
  
  SmoothieTab({super.key, required this.onAddToCart});

  //List of smoothies
  final List smoothie0nSale = [
    //smoothieFlavor,smoothiePrice,smoothieColor,smoothieImagePath,smoothieProvider
    ['Pitahaya', '95', Colors.pink,"lib/images/S_pitaya.png", 'Jamba Juice'],
    ['Mango', '100', Colors.orange,"lib/images/S_mango.png", 'Smoothie King'],
    ['Banana', '90', Colors.yellow,"lib/images/S_plátano.png", 'Tropical Smoothie'],
    ['Matcha', '105', Colors.purple,"lib/images/S_matcha.png", 'Boost Juice'],
    ['Strawberry', '95', Colors.pink,"lib/images/S_frutosrojos.png", 'Jamba Juice'],
    ['Fresa', '100', Colors.red,"lib/images/S_fresas.png", 'Smoothie King'],
    ['Mora', '90', Colors.blue,"lib/images/S_moraazul.png", 'Tropical Smoothie'],
    ['Piña', '105', Colors.yellow,"lib/images/S_piña.png", 'Boost Juice']

  ];

  @override
  Widget build(BuildContext context) {
      //el grid es la celda donde van los elementos

      return GridView.builder(
        //se encarga de acomodar los elementos en el grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //relacion de aspecto
          childAspectRatio: 1/1.4,
          //numero de columnas
          crossAxisCount: 2),
          //cuantos elementos va a tener
          itemCount: smoothie0nSale.length,
          //que va a haber en cada elemento
          itemBuilder: (context, index){
            return SmoothieTile(
              smoothieFlavor: smoothie0nSale[index][0],
              smoothiePrice: smoothie0nSale[index][1],
              smoothieColor: smoothie0nSale[index][2],
              smoothieImagePath: smoothie0nSale[index][3],
              smoothieProvider: smoothie0nSale[index][4],
              onAddToCart: (name, price, imagePath) => onAddToCart(name, price, imagePath),
            );
          },
      );
  }
}