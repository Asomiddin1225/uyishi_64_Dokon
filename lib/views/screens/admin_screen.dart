import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_64/controllers/products_controller.dart';
import 'package:uyishi_64/models/product.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Provider.of<ProductsController>(context);

    void _showProductDialog({Product? product}) {
      final isNewProduct = product == null;
      final TextEditingController titleController =
          TextEditingController(text: product?.title ?? '');
      final TextEditingController priceController = TextEditingController(
          text: product != null ? product!.price.toString() : '');
      final Color color = product?.color ?? Colors.blue;

      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(isNewProduct ? "Yangi Qo'shish" : "O'zgartirish"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Nomi'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Narxi'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Bekor Qilishl'),
              ),
              TextButton(
                onPressed: () {
                  final title = titleController.text;
                  final price = double.tryParse(priceController.text) ?? 0.0;
                  if (isNewProduct) {
                    productsController.addProduct(Product(
                      id: UniqueKey().toString(),
                      title: title,
                      price: price,
                      color: color,
                    ));
                  } else {
                    productsController.updateProduct(Product(
                      id: product!.id,
                      title: title,
                      price: price,
                      color: product.color,
                    ));
                  }
                  Navigator.of(ctx).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Maxshulodlarni Taxrirlash oynasi"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _showProductDialog();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text(product.price.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showProductDialog(product: product);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    productsController.removeProduct(product.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
