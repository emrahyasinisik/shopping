import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/providers/favorites_provider.dart';
import 'package:shopping/screens/start.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StartScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = ref.watch(favoriteProductProvider);

    return Scaffold(
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
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          var product = favoriteProducts[index];
          return ListTile(
            leading: SizedBox(
                height: 200,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.contain,
                )),
            title: Text(product.productName),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () {
                // Favoriden çıkar
                ref
                    .read(favoriteProductProvider.notifier)
                    .toggleProductFavorite(product);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, size: 30, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30, color: Colors.grey),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
