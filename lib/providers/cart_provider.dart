import 'package:flutter/foundation.dart';
import 'package:challenge5/models/menu_item.dart';
import 'package:challenge5/models/restaurant.dart';

class CartItem {
  final String restaurantId;
  final String restaurantName;
  final MenuItem menuItem;
  int quantity;

  CartItem({
    required this.restaurantId,
    required this.restaurantName,
    required this.menuItem,
    this.quantity = 1,
  });

  int get totalPrice => menuItem.price * quantity;
}

class CartProvider with ChangeNotifier {
  final Map<String, List<CartItem>> _items = {};
  Restaurant? _currentRestaurant;

  Map<String, List<CartItem>> get items => _items;
  Restaurant? get currentRestaurant => _currentRestaurant;

  void setCurrentRestaurant(Restaurant restaurant) {
    _currentRestaurant = restaurant;
    notifyListeners();
  }

  void addItem(Restaurant restaurant, MenuItem menuItem, {int quantity = 1}) {
    // 다른 식당의 메뉴를 담으려고 할 때
    if (_items.isNotEmpty && !_items.containsKey(restaurant.id)) {
      throw Exception('다른 식당의 메뉴는 담을 수 없습니다.');
    }

    _items.putIfAbsent(restaurant.id, () => []);

    final restaurantItems = _items[restaurant.id]!;
    final existingItemIndex = restaurantItems.indexWhere(
      (item) => item.menuItem.name == menuItem.name,
    );

    if (existingItemIndex >= 0) {
      // 기존 수량에 새로운 수량을 더하거나 설정
      if (quantity > 0) {
        restaurantItems[existingItemIndex].quantity = quantity;
      } else {
        restaurantItems[existingItemIndex].quantity++;
      }
    } else {
      restaurantItems.add(
        CartItem(
          restaurantId: restaurant.id,
          restaurantName: restaurant.name,
          menuItem: menuItem,
          quantity: quantity > 0 ? quantity : 1,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String restaurantId, String menuName) {
    if (!_items.containsKey(restaurantId)) return;

    final restaurantItems = _items[restaurantId]!;
    final itemIndex = restaurantItems.indexWhere(
      (item) => item.menuItem.name == menuName,
    );

    if (itemIndex >= 0) {
      if (restaurantItems[itemIndex].quantity > 1) {
        restaurantItems[itemIndex].quantity--;
      } else {
        restaurantItems.removeAt(itemIndex);
      }

      if (restaurantItems.isEmpty) {
        _items.remove(restaurantId);
        _currentRestaurant = null;
      }

      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    _currentRestaurant = null;
    notifyListeners();
  }

  int get totalAmount {
    int total = 0;
    _items.forEach((_, items) {
      for (var item in items) {
        total += item.totalPrice;
      }
    });
    return total;
  }

  int get itemCount {
    int count = 0;
    _items.forEach((_, items) {
      for (var item in items) {
        count += item.quantity;
      }
    });
    return count;
  }

  bool get isEmpty => _items.isEmpty;

  void setItemQuantity(String restaurantId, String menuName, int quantity) {
    if (!_items.containsKey(restaurantId)) return;

    final restaurantItems = _items[restaurantId]!;
    final itemIndex = restaurantItems.indexWhere(
      (item) => item.menuItem.name == menuName,
    );

    if (itemIndex >= 0) {
      if (quantity > 0) {
        restaurantItems[itemIndex].quantity = quantity;
      } else {
        restaurantItems.removeAt(itemIndex);
        if (restaurantItems.isEmpty) {
          _items.remove(restaurantId);
          _currentRestaurant = null;
        }
      }
      notifyListeners();
    }
  }
}
