import 'package:capstone/model/product_item_model.dart';
import 'package:flutter/cupertino.dart';

class RemoveItemController extends ChangeNotifier{
  List<ProductItemModel> _items = [];

  List<ProductItemModel> get items => _items;

  editItemList({required List<ProductItemModel> productList}){
    _items = productList;

  }
  void removeItem({required int index}) {
    _items.removeAt(index);
    notifyListeners();
  }


}