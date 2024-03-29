// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//import 'package:scoped_model/scoped_model.dart';

import 'package:shrine_mvc/src/controller.dart' show StateXController;

import 'package:shrine_mvc/src/model.dart'
    show Category, Product, ProductsRepository;

double _salesTaxRate = 0.06;
double _shippingCostPerItem = 7;

///
class AppStateModel extends StateXController {
  //} extends Model {
  ///
  factory AppStateModel() => _this ??= AppStateModel._();
  AppStateModel._() : super();
  static AppStateModel? _this;

  // All the available products.
  List<Product>? _availableProducts;

  // The currently selected category of products.
  Category _selectedCategory = Category.all;

  // The IDs and quantities of products currently in the cart.
  final Map<int, int> _productsInCart = {};

  ///
  Map<int, int> get productsInCart => Map<int, int>.from(_productsInCart);

  // Total number of items in the cart.
  ///
  int get totalCartQuantity =>
      _productsInCart.values.fold(0, (int v, int e) => v + e);

  ///
  Category get selectedCategory => _selectedCategory;

  /// Totaled prices of the items in the cart.
  double get subtotalCost {
    double total;
    if (_productsInCart.isEmpty) {
      total = 0;
    } else {
      total = _productsInCart.keys
          .map((int id) => _availableProducts![id].price * _productsInCart[id]!)
          .fold(0, (double sum, int e) => sum + e);
    }
    return total;
  }

  /// Sales tax for the items in the cart
  double get tax => subtotalCost * _salesTaxRate;

  /// Total cost to order everything in the cart.
  double get totalCost => subtotalCost + shippingCost + tax;

  /// Total shipping cost for the items in the cart.
  double get shippingCost {
    return _shippingCostPerItem *
        _productsInCart.values.fold(0.0, (num sum, int e) => sum + e);
  }

  /// Returns a copy of the list of available products, filtered by category.
  List<Product> getProducts() {
    if (_availableProducts == null) {
      return <Product>[];
    }

    if (_selectedCategory == Category.all) {
      return List<Product>.from(_availableProducts!);
    } else {
      return _availableProducts!
          .where((Product p) => p.category == _selectedCategory)
          .toList();
    }
  }

  /// Update the App's interface with InheritedWidgets
  void refresh() {
    // Update the App's 'root' State (i.e. App's Title)
    rootState?.notifyClients();
    // Update the App's main screen (i.e. Product Page)
    notifyClients();
  }

  /// Adds a product to the cart.
  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      int count = _productsInCart[productId]!;
      _productsInCart[productId] = count++;
    }
    refresh();
  }

  /// Removes an item from the cart.
  void removeItemFromCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        int product = _productsInCart[productId]!;
        _productsInCart[productId] = product--;
      }
    }
    refresh();
  }

  /// Returns the Product instance matching the provided id.
  Product getProductById(int id) {
    return _availableProducts!.firstWhere((Product p) => p.id == id);
  }

  /// Removes everything from the cart.
  void clearCart() {
    _productsInCart.clear();
    refresh();
  }

  /// Loads the list of available products from the repo.
  void loadProducts() {
    _availableProducts = ProductsRepository.loadProducts(Category.all);
  }

  ///
  //ignore: use_setters_to_change_properties
  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
  }

  @override
  String toString() {
    return 'AppStateModel(totalCost: $totalCost)';
  }
}
