import 'package:DONUT_APP_8SC_25_3/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final Function(String, double, String) onAddToCart;
  
  PizzaTab({super.key, required this.onAddToCart});

  //List of pizzas
  final List pizza0nSale = [
    //pizzaFlavor,pizzaPrice,pizzaColor,pizzaImagePath,pizzaProvider
    ['Pepperoni', '180', Colors.red,"lib/images/peperoni.png", 'Domino\'s'],
    ['Pastor', '170', Colors.green,"lib/images/Pastor.png", 'Pizza Hut'],
    ['Hawaiian', '190', Colors.orange,"lib/images/hawaiiana.png", 'Papa John\'s'],
    ['Champiñones', '200', Colors.deepOrange,"lib/images/champiñones.png", 'Little Caesars'],
    ['Carne', '190', Colors.yellow,"lib/images/carne.png", 'Papa John\'s'],
    ['Vegana', '190', Colors.green,"lib/images/vegana.png", 'Papa John\'s'],
    ['Vegetariana', '190', Colors.blue,"lib/images/vegetariana.png", 'Papa John\'s'],
    ['4 Quesos', '190', Colors.yellow,"lib/images/4_quesos.png", 'Papa John\'s']

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
          itemCount: pizza0nSale.length,
          //que va a haber en cada elemento
          itemBuilder: (context, index){
            return PizzaTile(
              pizzaFlavor: pizza0nSale[index][0],
              pizzaPrice: pizza0nSale[index][1],
              pizzaColor: pizza0nSale[index][2],
              pizzaImagePath: pizza0nSale[index][3],
              pizzaProvider: pizza0nSale[index][4],
              onAddToCart: (name, price, imagePath) => onAddToCart(name, price, imagePath),
            );
          },
      );
  }
}