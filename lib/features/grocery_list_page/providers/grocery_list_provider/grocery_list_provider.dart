import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/grocery_list_page/services/local_services/grocery_list_hive_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'grocery_list_provider.g.dart';

@riverpod
class GroceryList extends _$GroceryList {
  @override
  List<GroceryModel> build() {
    try {
      logger.d('Fetching groceries from Hive');
      final result = GroceryListService().getGroceries();
      logger.d('Successfully fetched groceries from Hive');
      return result;
    } catch (e, st) {
      logger.d('Error: Unable to get groceries from Hive',
          error: e, stackTrace: st);
      throw Exception('Something went wrong');
    }
  }

  Future<void> addMultipleGroceries(
      List<GroceryModel> groceries) async {
    for (GroceryModel grocery in groceries) {
      await addGrocery(
        grocery
      );
    }
  }

  Future<void> updateMultipleGroceries(
      List<GroceryModel> groceries) async {
    for (GroceryModel grocery in groceries) {
      await updateGrocery(
          item: grocery,
          key: grocery.key);
    }
  }

  Future<void> addGrocery(GroceryModel item) async {
    try {
      logger.d('Attempting to add grocery to Hive');
      await GroceryListService().addGrocery(item);
      logger.d('Successfully added grocery to Hive');
      ref.invalidateSelf();
    } catch (e, st) {
      logger.d('Unable to get groceries from Hive', error: e, stackTrace: st);
    }
  }

  Future<void> updateGrocery(
      {required GroceryModel item,
      required dynamic key}) async {
    try {
      logger.d('Attempting to update grocery in Hive');
      await GroceryListService().updateGrocery(
          item, key);
      logger.d('Successfully updated grocery in Hive');
      ref.invalidateSelf();
    } catch (e, st) {
      logger.d("Unable to update groceries in Hive", error: e, stackTrace: st);
    }
  }

  Future<void> deleteAllGrocery({required List<dynamic> keys}) async {
    try {
      logger.d('Attempting to delete all grocery items');
      await GroceryListService().removeAllGroceries(keys);
      logger.d('Successfully deleted all grocery items');
      ref.invalidateSelf();
    } catch (e, st) {
      logger.d('Unable to delete all groceries from Hive',
          error: e, stackTrace: st);
    }
  }

  Future<void> deleteGrocery({required dynamic key}) async {
    try {
      logger.d('Attempting to delete grocery from Hive');
      await GroceryListService().removeGrocery(key);
      logger.d('Successfully deleted grocery from Hive');
      ref.invalidateSelf();
    } catch (e, st) {
      logger.d('Failed to delete grocery from Hive', error: e, stackTrace: st);
    }
  }
}
