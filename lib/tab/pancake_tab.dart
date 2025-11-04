import 'package:DONUT_APP_8SC_25_3/utils/pancake_tile.dart';
import 'package:flutter/material.dart';

class PancakeTab extends StatelessWidget {
  final Function(String, double, String) onAddToCart;
  
  PancakeTab({super.key, required this.onAddToCart});

  //List of pancakes
  final List pancake0nSale = [
    //pancakeFlavor,pancakePrice,pancakeColor,pancakeImagePath,pancakeProvider
    ['Chocolate', '85', Colors.brown,"lib/images/pank_chocolate.png", 'IHOP'],
    ['Strawberry', '90', Colors.pink,"lib/images/pank_fresas.png", 'Denny\'s'],
    ['Blueberry', '88', Colors.blue,"lib/images/pank_moraazul.png", 'Waffle House'],
    ['Banana', '75', Colors.yellow,"lib/images/pank_banana.png", 'Bob Evans'],
    ['Cajeta', '85', Colors.brown,"lib/images/pank_cajeta.png", 'IHOP'],
    ['Frutos rojos', '90', Colors.pink,"lib/images/pank_frutosrojos.png", 'Denny\'s'],
    ['Crema Batida', '88', Colors.blue,"lib/images/pank_cremabatida.png", 'Waffle House'],
    ['Sencillo', '75', Colors.yellow,"lib/images/pank_sencillos.png", 'Bob Evans']

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
          itemCount: pancake0nSale.length,
          //que va a haber en cada elemento
          itemBuilder: (context, index){
            return PancakeTile(
              pancakeFlavor: pancake0nSale[index][0],
              pancakePrice: pancake0nSale[index][1],
              pancakeColor: pancake0nSale[index][2],
              pancakeImagePath: pancake0nSale[index][3],
              pancakeProvider: pancake0nSale[index][4],
              onAddToCart: (name, price, imagePath) => onAddToCart(name, price, imagePath),
            );
          },
      );
  }
}