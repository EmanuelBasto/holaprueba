import 'package:DONUT_APP_8SC_25_3/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final Function(String, double, String) onAddToCart;
  
  DonutTab({super.key, required this.onAddToCart});

  //List of donuts
  final List donut0nSale = [
    //donutFlavor,donutPrince,donutColor,donutImagePath,donutProvider
    ['Chocolate', '100', Colors.brown,"lib/images/chocolate_donut.png", 'Starbucks'],
    ['Strawberry', '89', Colors.pink,"lib/images/strawberry_donut.png", 'krispy Cream'],
    ['Ice Cream', '95', Colors.blue,"lib/images/icecream_donut.png", 'Dunkin Donuts'],
    ['Grape', '70', Colors.purple,"lib/images/grape_donut.png", 'Oxxo'],
    ['Choco Crema', '100', Colors.brown,"lib/images/D_choco_crema.png", 'Starbucks'],
    ['Azucaradas', '89', Colors.pink,"lib/images/D_azucaradas.png", 'krispy Cream'],
    ['Crema Chispas', '95', Colors.blue,"lib/images/D_crema_chispas.png", 'Dunkin Donuts'],
    ['Caramelo', '70', Colors.purple,"lib/images/D_caramelo.png", 'Oxxo']

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
          itemCount: donut0nSale.length,
          //que va a haber en cada elemento
          itemBuilder: (context, index){
            return DonutTile(
              donutFlavor: donut0nSale[index][0],
              donutPrice: donut0nSale[index][1],
              donutColor: donut0nSale[index][2],
              donutImagePath: donut0nSale[index][3],
              donutProvider: donut0nSale[index][4],
              onAddToCart: (name, price, imagePath) => onAddToCart(name, price, imagePath),
            );
          },
      );
  }
}