import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';

class GroceryListService {
  final _groceryListBox = Hive.box('grocery_list');

  Future<void> addGrocery(GroceryModel item) async {
    Map<String, dynamic> itemMap = item.toJson();
    await _groceryListBox.add(itemMap);
  }

  Future<void> addMultipleGroceries(List<GroceryModel> items) async {
    await _groceryListBox.addAll(items);
  }

  Future<void> removeGrocery(dynamic key) async {
    await _groceryListBox.delete(key);
  }

  Future<void> removeAllGroceries(List<dynamic> keys) async {
    await _groceryListBox.deleteAll(keys);
  }

  Future<void> updateGrocery(GroceryModel item, dynamic key) async {
    await _groceryListBox.put(key, item);
  }

  List<GroceryModel> getGroceries() {
    final data = _groceryListBox.keys.map((key) {
      Map<String, dynamic> item = _groceryListBox.get(key);
      item['key'] = key;
      return item;
    }).toList();

    return data.map((e) => GroceryModel.fromJson(e)).toList();
  }
}
