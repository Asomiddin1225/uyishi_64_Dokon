import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_64/controllers/cart_controller.dart';
import 'package:uyishi_64/models/product.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final products = cartController.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buyurtmalar"),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text("Savatchangiz bo'sh. Mahsulot qo'shing!"),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                final productEntry = products.entries.toList()[index];
                // final productEntry = products[index];

                final product = productEntry.value['product'] as Product;
                final dateAdded = productEntry.value['dateAdded'] as DateTime;

                return ListTile(
                  title: Text(
                      product.title), // Assuming 'name' is a field in Product
                  subtitle: Text(
                    'Qo\'shilgan sana: ${dateAdded.toLocal().toString().split(' ')[0]}\n'
                    'Qo\'shilgan vaqt: ${dateAdded.toLocal().toString().split(' ')[1].split('.')[0]}',
                  ),
                  trailing: Text('Narxi: \$${product.price}'),
                );
              },
            ),
    );
  }
}
