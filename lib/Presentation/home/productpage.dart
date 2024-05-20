import 'package:flutter/material.dart';
import 'package:weigh_master/Presentation/cart/cart.dart';
import 'package:weigh_master/Presentation/home/buy.dart';

class ProductBuyingPage extends StatefulWidget {
  final Product product;
  final Cart cart = Cart();

  ProductBuyingPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductBuyingPageState createState() => _ProductBuyingPageState();
}

class _ProductBuyingPageState extends State<ProductBuyingPage> {
  int quantity = 1;
  bool isLiked = false;
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void addToCart() {
    widget.cart.addToCart(widget.product);
    print('Product added to cart: ${widget.product.name}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage(cart: widget.cart)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18 / 13,
                  child: Container(
                    color: Colors.grey[300],
                    child: Image.asset(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                    print(
                        'Product ${widget.product.name} ${isLiked ? 'liked' : 'unliked'}');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.product.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decrementQuantity,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: incrementQuantity,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: addToCart,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(350, 50)),
                    ),
                    child:
                        const Text('Add to Cart', textAlign: TextAlign.center),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print('Product bought');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Adjust the color as needed
                    ),
                    child: const Text('Buy', textAlign: TextAlign.center),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
