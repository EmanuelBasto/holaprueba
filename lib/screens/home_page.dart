import 'package:DONUT_APP_8SC_25_3/tab/burger_tab.dart';
import 'package:DONUT_APP_8SC_25_3/tab/donut_tab.dart';
import 'package:DONUT_APP_8SC_25_3/tab/pancake_tab.dart';
import 'package:DONUT_APP_8SC_25_3/tab/pizza_tab.dart';
import 'package:DONUT_APP_8SC_25_3/tab/smoothie_tab.dart';
import 'package:DONUT_APP_8SC_25_3/utils/my_tab.dart';
import 'package:DONUT_APP_8SC_25_3/utils/cart_item.dart';
import 'package:DONUT_APP_8SC_25_3/utils/cart_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Estado del carrito
  List<CartItem> cartItems = [];
  
  //Getters para el contador y total
  int get itemCount => cartItems.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice => cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  //Función para agregar items al carrito
  void addToCart(String name, double price, String imagePath) {
    setState(() {
      //Buscar si el producto ya está en el carrito
      final existingItemIndex = cartItems.indexWhere((item) => item.name == name);
      
      if (existingItemIndex != -1) {
        //Si ya existe, incrementar la cantidad
        cartItems[existingItemIndex].quantity++;
      } else {
        //Si no existe, agregarlo
        cartItems.add(CartItem(
          name: name,
          price: price,
          imagePath: imagePath,
          quantity: 1,
        ));
      }
    });
  }

  //Función para mostrar el carrito
  void showCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CartBottomSheet(cartItems: cartItems),
    );
  }

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
            DonutTab(onAddToCart: addToCart),
            BurgerTab(onAddToCart: addToCart),
            SmoothieTab(onAddToCart: addToCart),
            PancakeTab(onAddToCart: addToCart),
            PizzaTab(onAddToCart: addToCart),
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
                    Text('$itemCount ${itemCount == 1 ? 'Item' : 'Items'} | \$${totalPrice.toStringAsFixed(2)}', style: TextStyle(
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
                    onPressed: showCart, 
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