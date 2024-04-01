import 'package:flutter/material.dart';
import 'package:shopping/data/category_data.dart';
import 'package:shopping/data/product_data.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/widgets/category_card.dart';
import 'package:shopping/widgets/product_card.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> productList = products;
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          SizedBox(
            height: 120,
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
                crossAxisSpacing: 2,
                childAspectRatio: 1 / 1.25,
                mainAxisSpacing: 2,
              ),
              children:
                  productList.map((e) => ProductCard(product: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
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
    );
  }
}
