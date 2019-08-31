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

import 'package:shrine_mvc/src/model.dart' show Category, Product, I18n;

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    List<Product> allProducts = <Product>[
      Product(
        category: Category.accessories,
        id: 0,
        isFeatured: true,
        name: I18n.s('Vagabond sack'),
        price: 120,
      ),
      Product(
        category: Category.accessories,
        id: 1,
        isFeatured: true,
        name: I18n.s('Stella sunglasses'),
        price: 58,
      ),
      Product(
        category: Category.accessories,
        id: 2,
        isFeatured: false,
        name: I18n.s('Whitney belt'),
        price: 35,
      ),
      Product(
        category: Category.accessories,
        id: 3,
        isFeatured: true,
        name: I18n.s('Garden strand'),
        price: 98,
      ),
      Product(
        category: Category.accessories,
        id: 4,
        isFeatured: false,
        name: I18n.s('Strut earrings'),
        price: 34,
      ),
      Product(
        category: Category.accessories,
        id: 5,
        isFeatured: false,
        name: I18n.s('Varsity socks'),
        price: 12,
      ),
      Product(
        category: Category.accessories,
        id: 6,
        isFeatured: false,
        name: I18n.s('Weave keyring'),
        price: 16,
      ),
      Product(
        category: Category.accessories,
        id: 7,
        isFeatured: true,
        name: I18n.s('Gatsby hat'),
        price: 40,
      ),
      Product(
        category: Category.accessories,
        id: 8,
        isFeatured: true,
        name: I18n.s('Shrug bag'),
        price: 198,
      ),
      Product(
        category: Category.home,
        id: 9,
        isFeatured: true,
        name: I18n.s('Gilt desk trio'),
        price: 58,
      ),
      Product(
        category: Category.home,
        id: 10,
        isFeatured: false,
        name: I18n.s('Copper wire rack'),
        price: 18,
      ),
      Product(
        category: Category.home,
        id: 11,
        isFeatured: false,
        name: I18n.s('Soothe ceramic set'),
        price: 28,
      ),
      Product(
        category: Category.home,
        id: 12,
        isFeatured: false,
        name: I18n.s('Hurrahs tea set'),
        price: 34,
      ),
      Product(
        category: Category.home,
        id: 13,
        isFeatured: true,
        name: I18n.s('Blue stone mug'),
        price: 18,
      ),
      Product(
        category: Category.home,
        id: 14,
        isFeatured: true,
        name: I18n.s('Rainwater tray'),
        price: 27,
      ),
      Product(
        category: Category.home,
        id: 15,
        isFeatured: true,
        name: I18n.s('Chambray napkins'),
        price: 16,
      ),
      Product(
        category: Category.home,
        id: 16,
        isFeatured: true,
        name: I18n.s('Succulent planters'),
        price: 16,
      ),
      Product(
        category: Category.home,
        id: 17,
        isFeatured: false,
        name: I18n.s('Quartet table'),
        price: 175,
      ),
      Product(
        category: Category.home,
        id: 18,
        isFeatured: true,
        name: I18n.s('Kitchen quattro'),
        price: 129,
      ),
      Product(
        category: Category.clothing,
        id: 19,
        isFeatured: false,
        name: I18n.s('Clay sweater'),
        price: 48,
      ),
      Product(
        category: Category.clothing,
        id: 20,
        isFeatured: false,
        name: I18n.s('Sea tunic'),
        price: 45,
      ),
      Product(
        category: Category.clothing,
        id: 21,
        isFeatured: false,
        name: I18n.s('Plaster tunic'),
        price: 38,
      ),
      Product(
        category: Category.clothing,
        id: 22,
        isFeatured: false,
        name: I18n.s('White pinstripe shirt'),
        price: 70,
      ),
      Product(
        category: Category.clothing,
        id: 23,
        isFeatured: false,
        name: I18n.s('Chambray shirt'),
        price: 70,
      ),
      Product(
        category: Category.clothing,
        id: 24,
        isFeatured: true,
        name: I18n.s('Seabreeze sweater'),
        price: 60,
      ),
      Product(
        category: Category.clothing,
        id: 25,
        isFeatured: false,
        name: I18n.s('Gentry jacket'),
        price: 178,
      ),
      Product(
        category: Category.clothing,
        id: 26,
        isFeatured: false,
        name: I18n.s('Navy trousers'),
        price: 74,
      ),
      Product(
        category: Category.clothing,
        id: 27,
        isFeatured: true,
        name: I18n.s('Walter henley (white)'),
        price: 38,
      ),
      Product(
        category: Category.clothing,
        id: 28,
        isFeatured: true,
        name: I18n.s('Surf and perf shirt'),
        price: 48,
      ),
      Product(
        category: Category.clothing,
        id: 29,
        isFeatured: true,
        name: I18n.s('Ginger scarf'),
        price: 98,
      ),
      Product(
        category: Category.clothing,
        id: 30,
        isFeatured: true,
        name: I18n.s('Ramona crossover'),
        price: 68,
      ),
      Product(
        category: Category.clothing,
        id: 31,
        isFeatured: false,
        name: I18n.s('Chambray shirt'),
        price: 38,
      ),
      Product(
        category: Category.clothing,
        id: 32,
        isFeatured: false,
        name: I18n.s('Classic white collar'),
        price: 58,
      ),
      Product(
        category: Category.clothing,
        id: 33,
        isFeatured: true,
        name: I18n.s('Cerise scallop tee'),
        price: 42,
      ),
      Product(
        category: Category.clothing,
        id: 34,
        isFeatured: false,
        name: I18n.s('Shoulder rolls tee'),
        price: 27,
      ),
      Product(
        category: Category.clothing,
        id: 35,
        isFeatured: false,
        name: I18n.s('Grey slouch tank'),
        price: 24,
      ),
      Product(
        category: Category.clothing,
        id: 36,
        isFeatured: false,
        name: I18n.s('Sunshirt dress'),
        price: 58,
      ),
      Product(
        category: Category.clothing,
        id: 37,
        isFeatured: true,
        name: I18n.s('Fine lines tee'),
        price: 58,
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) => p.category == category).toList();
    }
  }
}
