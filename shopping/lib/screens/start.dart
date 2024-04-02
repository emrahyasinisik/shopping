import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/data/category_data.dart';
import 'package:shopping/data/product_data.dart';
import 'package:shopping/models/product.dart';

import 'package:shopping/widgets/category_card.dart';
import 'package:shopping/widgets/product_card.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;

  static const List<BottomNavigationBarItem> _bottomNavBarItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 30, color: Colors.grey),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.bookmark,
        size: 30,
        color: Colors.grey,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, size: 30, color: Colors.grey),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
        color: Colors.grey,
        size: 30,
      ),
      label: "",
    ),
  ];

  // Geçerli sayfayı değiştirmek için kullanılan fonksiyon
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> productList = products;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 236, 237),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 236, 237),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(Icons.search),
        ),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 0),
              child: Text(
                "Make home",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
            Text(
              "BEAUTIFUL",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (context, index) {
                  return CategoryCard(categoryCardModel: categoryData[index]);
                },
              ),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                childAspectRatio: 1 / 1.5,
                mainAxisSpacing: 4,
              ),
              children:
                  productList.map((e) => ProductCard(product: e)).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        
      ),
    );
  }
}
