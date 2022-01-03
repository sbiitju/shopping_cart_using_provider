import 'package:flutter/cupertino.dart';
import 'package:shopping_cart_using_provider/models/items_model.dart';

class CartNotifier extends ChangeNotifier {
  List<Items> cartList = [];
  addCart(Items items) {
    cartList.add(items);
    notifyListeners();
  }
}
