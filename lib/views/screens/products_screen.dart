// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uyishi_64/controllers/products_controller.dart';
// import 'package:uyishi_64/views/screens/admin_screen.dart';
// import 'package:uyishi_64/views/screens/cart_screen.dart';
// import 'package:uyishi_64/views/widgets/product_item.dart';

// class ProductsScreen extends StatelessWidget {
//   ProductsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final productsController = Provider.of<ProductsController>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (ctx) {
//                   return AdminScreen();
//                 },
//               ),
//             );
//           },
//           icon: const Icon(Icons.person_pin),
//         ),
//         title: const Text("D I N A M O"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (ctx) {
//                     return const CartScreen();
//                   },
//                 ),
//               );
//             },
//             icon: const Icon(Icons.shopping_cart),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: productsController.list.length,
//         itemBuilder: (ctx, index) {
//           final product = productsController.list[index];
//           return ChangeNotifierProvider.value(
//             value: product,
//             child: ProductItem(),
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_64/controllers/products_controller.dart';
import 'package:uyishi_64/views/screens/admin_screen.dart';
import 'package:uyishi_64/views/screens/cart_screen.dart';
import 'package:uyishi_64/views/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Provider.of<ProductsController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) {
                  return AdminScreen();
                },
              ),
            );
          },
          icon: const Icon(Icons.person_pin),
        ),
        title: const Text("D I N A M O"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider.value(
            value: product,
            child: ProductItem(),
          );
        },
      ),
    );
  }
}
