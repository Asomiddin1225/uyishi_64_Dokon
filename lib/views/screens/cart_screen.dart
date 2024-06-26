import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_64/controllers/cart_controller.dart';
import 'package:uyishi_64/models/product.dart';
import 'package:uyishi_64/views/screens/buyurtma_screen.dart';
import 'package:uyishi_64/views/widgets/product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    final products = cartController.cart.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text("S A V A T C H A"),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text("Savatchangiz bo'sh. Mahsulot qo'shing!"),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                final product = products.values.toList()[index]['product'];
                return ChangeNotifierProvider<Product>.value(
                  value: product,
                  child: const ProductItem(),
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const OrdersScreen(),
                  ),
                );
              },
              backgroundColor: Colors.blue,
              extendedPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              label: const Text(
                "Buyurtmalar",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: Colors.amber,
              extendedPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              label: Text(
                "\$${cartController.cart.totalPrice}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
