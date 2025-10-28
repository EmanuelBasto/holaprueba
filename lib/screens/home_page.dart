import 'package:DONUT_APP_8SC_25_3/tab/burger_tab.dart';
import 'package:DONUT_APP_8SC_25_3/tab/donut_tab.dart';
import 'package:DONUT_APP_8SC_25_3/tab/pancake_tab.dart';
import 'package:DONUT_APP_8SC_25_3/tab/pizza_tab.dart';
import 'package:DONUT_APP_8SC_25_3/tab/smoothie_tab.dart';
import 'package:DONUT_APP_8SC_25_3/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //Donut
    const MyTab(iconPath: "lib/icons/donut.png", text: "Donut"),
    //Burguer
    const MyTab(iconPath: "lib/icons/burger.png", text: "Burger"),
    //smoothie
    const MyTab(iconPath: "lib/icons/smoothie.png", text: "Smoothie"),
    //pancake
    const MyTab(iconPath: "lib/icons/pancakes.png", text: "Pancakes"),
    //pizza
    const MyTab(iconPath: "lib/icons/pizza.png", text: "Pizza"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //Ícono de la izquierda
        leading: Icon(Icons.menu, color: Colors.grey[800]),
        //Ícono de la derecha
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: DefaultTabController(
        length: myTabs.length,
        child: Column(
          children: [
            //Texto principal
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text("I wan to ", style: TextStyle(fontSize: 24)),
                  Text(
                    "eat",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,

                      //Subrayado
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            //Pestañas (TabBar)
            TabBar(tabs: myTabs),

            //Contenido de las pestañas (TabBarView)
            Expanded(child: TabBarView(
              children: [
            DonutTab(),
            BurgerTab(),
            SmoothieTab(),
            PancakeTab(),
            PizzaTab(),
            ],)),
            //Carrrito de compras (Cart)

            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 28),
                  child: Column(
                    //se pega a la izquierda
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('2 Items | \$45.00', style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold),
                      ),
                    Text('Delivery charrges included',
                    style: TextStyle(
                      fontSize: 12),
                      ),
                  ],)
                  ,),
                  //botón de checkout
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.pink,padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    ),
                    onPressed: (){}, 
                  child: const Text('View Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ))),
                ],) 

              ,)
          ],
        ),
      ),
    );
  }
}

class PanCakeTab {
}