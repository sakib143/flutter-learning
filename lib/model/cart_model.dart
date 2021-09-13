
import 'package:testing/model/CatelogModel.dart';

class CartModel {

  //Creating single class of Cart Model
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  //Cart model getter and setter/
  late CatalogModel _catelog; 
  CatalogModel get catelog => _catelog; 
  set catelog(CatalogModel model) {
    assert(model != null);
    _catelog = model;
  }

  //Collection of ids
  final List<int> _itemIds = [];

  //Get all item in list from Catalog model
  List<Item> get items => _itemIds.map((id) => _catelog.byId(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  //Add item
  void addItem(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item
  void removeItem(Item item) {
      _itemIds.remove(item.id);
  }

}