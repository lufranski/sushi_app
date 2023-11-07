import 'package:flutter/widgets.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/constants/constants.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _sushi = [
    Food(
      name: 'Salmon Nigiri',
      price: '21.00',
      imgPath: 'lib/assets/img/nigiri_salmon.png',
      rating: '4.9',
      description: descriptions.salmon,
    ),
    Food(
      name: 'Tuna Nigiri',
      price: '23.00',
      imgPath: 'lib/assets/img/nigiri_tuna.png',
      rating: '4.5',
      description: descriptions.tuna,
    ),
  ];
  // customer cart
  List<Food> _cart = [];
  // getters
  List<Food> get sushi => _sushi;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food item, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(item);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food item) {
    _cart.remove(item);
    notifyListeners();
  }
}
