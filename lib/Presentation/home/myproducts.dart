import 'package:flutter/material.dart';

import 'buy.dart';

class MyProductsPage extends StatefulWidget {
  late final Product product;
  @override
  _MyProductsPageState createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        backgroundColor: const Color.fromARGB(255, 163, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabItem(0, 'Bought'),
                _buildTabItem(1, 'Rented'),
              ],
            ),
            Expanded(
              child: selectedIndex == 0
                  ? _buildProductList('Bought Products', _getBoughtProducts())
                  : _buildProductList('Rented Products', _getRentedProducts()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProductList(String title, List<String> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index]),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {},
        );
      },
    );
  }

  List<String> _getBoughtProducts() {
    return ['Product 1', 'Product 2', 'Product 3'];
    
  }

  List<String> _getRentedProducts() {
    return ['Rented Product 1', 'Rented Product 2', 'Rented Product 3'];
  }
}
