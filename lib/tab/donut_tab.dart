import 'package:DONUT_APP_8SC_25_3/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  DonutTab({super.key});

  //List of donuts
  final List donut0nSale = [
    //donutFlavor,donutPrince,donutColor,donutImagePath,donutProvider
    ['Chocolate', '100', Colors.brown,"Lib/images/chocolate_donut.png", 'Starbucks'],
    ['Strawberry', '89', Colors.pink,"Lib/images/strawberry_donut.png", 'krispy Cream'],
    ['Ice Cream', '95', Colors.blue,"Lib/images/icecream_donut.png", 'Dunkin Donuts'],
    ['Grape', '70', Colors.purple,"Lib/images/grape_donut.png", 'Oxxo']

  ];

  @override
  Widget build(BuildContext context) {
      //el grid es la celda donde van los elementos

      return GridView.builder(
        //se encarga de acomodar los elementos en el grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //relacion de aspecto
          childAspectRatio: 2/2.6,
          //numero de columnas
          crossAxisCount: 3),
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
            );
          },
      );
  }
}