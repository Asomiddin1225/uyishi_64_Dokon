// import 'package:flutter/material.dart';

// import '../models/product.dart';

// class ProductsController extends ChangeNotifier {
//   final List<Product> _list = [
//     Product(
//       id: UniqueKey().toString(),
//       title: "iPhone 15",
//       price: 990,
//       color: Colors.blue,
//     ),
//     Product(
//       id: UniqueKey().toString(),
//       title: "Samsung Galaxy XP 2",
//       price: 920,
//       color: Colors.teal,
//     ),
//     Product(
//       id: UniqueKey().toString(),
//       title: "Tesla Model Y",
//       price: 35990,
//       color: Colors.grey,
//     ),
//     Product(
//       id: UniqueKey().toString(),
//       title: "Macbook Pro",
//       price: 1225.5,
//       color: Colors.red,
//     ),
//   ];

//   List<Product> get list {
//     return [..._list];
//   }

//   void addProduct(Product product) {}
// }





import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone 15",
      price: 990,
      color: Colors.blue,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Samsung Galaxy XP 2",
      price: 920,
      color: Colors.teal,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Tesla Model Y",
      price: 35990,
      color: Colors.grey,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Macbook Pro",
      price: 1225.5,
      color: Colors.red,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }

  void addProduct(Product product) {
    _list.add(product);
    notifyListeners();
  }

  void removeProduct(String id) {
    _list.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  void updateProduct(Product updatedProduct) {
    final index = _list.indexWhere((product) => product.id == updatedProduct.id);
    if (index >= 0) {
      _list[index] = updatedProduct;
      notifyListeners();
    }
  }
}
