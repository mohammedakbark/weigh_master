import 'package:flutter/material.dart';
import 'package:weigh_master/Presentation/home/buy.dart'; 

class CartPage extends StatelessWidget {
  final Cart cart;

  const CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final product = cart.items[index];
          return ListTile(
            leading: Image.asset(
              product.imageUrl,
              width: 50,
              height: 50,
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                cart.removeProduct(product); 
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Product removed from cart'),
                ));
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: <Widget>[
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Canceled'),
                ));
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Proceed to purchase'),
                ));
              },
              child: const Text('Proceed to Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}
