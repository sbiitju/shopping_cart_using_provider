import 'package:flutter/cupertino.dart';
import 'package:shopping_cart_using_provider/models/items_model.dart';

class AddItemsProvider extends ChangeNotifier{
  List<Items> itemList =[];
  var imageCounnter=0;
  addItems(itemsName,itemsPrice,itemsImage){
    Items items=Items(itemsName, itemsPrice, itemsImage);
    itemList.add(items);
    imageCounnter=imageCounnter+1;
    notifyListeners();
  }
}