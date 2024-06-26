
import 'package:flutter/material.dart';
import 'package:uyishi_64/models/cart.dart';
import 'package:uyishi_64/models/product.dart';

class CartController extends ChangeNotifier {
  final Cart _cart = Cart(
    products: {},
    totalPrice: 0,
  );

  Cart get cart {
    return _cart;
  }

  get orders => null;

  get products => null;

  void addToCart(Product product) {
    // agar mahsulot savatchada bo'lsa
    if (isProductInCart(product.id)) {
      _cart.products[product.id]['amount']++;
    }
    // agar mahsulot savatchada bo'lmasa
    else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }

    calculateTotalPrice();
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.products[productId]['amount'] == 1) {
      _cart.products.removeWhere((key, value) {
        return key == productId;
      });
    } else {
      _cart.products[productId]['amount']--;
    }
    calculateTotalPrice();
    notifyListeners();
  }

  void calculateTotalPrice() {
    double total = 0;
    _cart.products.forEach((key, value) {
      total += value['product'].price * value['amount'];
    });
    _cart.totalPrice = total;
  }

  bool isProductInCart(String productId) {
    return _cart.products.containsKey(productId);
  }

  int getProductAmount(String productId) {
    return _cart.products[productId]['amount'];
  }
}
