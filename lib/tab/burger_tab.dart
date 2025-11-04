import 'package:DONUT_APP_8SC_25_3/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final Function(String, double, String) onAddToCart;
  
  BurgerTab({super.key, required this.onAddToCart});

  //List of burgers
  final List burger0nSale = [
    //burgerFlavor,burgerPrice,burgerColor,burgerImagePath,burgerProvider
    ['Classic', '120', Colors.orange,"lib/images/Bur_clásica.png", 'McDonald\'s'],
    ['Frutal', '130', Colors.amber,"lib/images/Bur_frutal.png", 'Burger King'],
    ['Hawaiiana', '150', Colors.brown,"lib/images/Bur_hawaiiana.png", 'Carl\'s Jr'],
    ['Huevo', '110', Colors.green,"lib/images/Bur_huevo.png", 'Subway'],
    ['Pollo', '110', Colors.orange,"lib/images/Bur_pollo.png", 'Burger King'],
    ['Tocino', '110', Colors.pink,"lib/images/Bur_tocino.png", 'Subway'],
    ['Pizza', '110', Colors.yellow,"lib/images/Bur_pizza.png", 'Carl\'s Jr'],
    ['Xtreme', '110', Colors.blue,"lib/images/Bur_xtreme.png", 'McDonald\'s']

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
          itemCount: burger0nSale.length,
          //que va a haber en cada elemento
          itemBuilder: (context, index){
            return BurgerTile(
              burgerFlavor: burger0nSale[index][0],
              burgerPrice: burger0nSale[index][1],
              burgerColor: burger0nSale[index][2],
              burgerImagePath: burger0nSale[index][3],
              burgerProvider: burger0nSale[index][4],
              onAddToCart: (name, price, imagePath) => onAddToCart(name, price, imagePath),
            );
          },
      );
  }
}