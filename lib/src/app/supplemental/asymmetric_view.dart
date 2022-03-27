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

import 'dart:ui' show PointerDeviceKind;

import 'package:shrine_mvc/src/view.dart';

import 'package:shrine_mvc/src/model.dart' show Product;

import 'package:shrine_mvc/src/app/supplemental/product_columns.dart'
    show OneProductCardColumn, TwoProductCardColumn;

///
class AsymmetricView extends StatelessWidget {
  ///
  const AsymmetricView({Key? key, this.products}) : super(key: key);

  ///
  final List<Product>? products;

  List<Container> _buildColumns(BuildContext context) {
    if (products == null || products!.isEmpty) {
      return const <Container>[];
    }

    final List<Product> _products = products!;

    // This will return a list of columns. It will oscillate between the two
    // kinds of columns. Even cases of the index (0, 2, 4, etc) will be
    // TwoProductCardColumn and the odd cases will be OneProductCardColumn.
    //
    // Each pair of columns will advance us 3 products forward (2 + 1). That's
    // some kinda awkward math so we use _evenCasesIndex and _oddCasesIndex as
    // helpers for creating the index of the product list that will correspond
    // to the index of the list of columns.
    return List<Container>.generate(_listItemCount(_products.length),
        (int index) {
      double width = .59 * MediaQuery.of(context).size.width;
      Widget column;
      if (index % 2 == 0) {
        /// Even cases
        final int bottom = _evenCasesIndex(index);
        column = TwoProductCardColumn(
          bottom: _products[bottom],
          top:
              _products.length - 1 >= bottom + 1 ? _products[bottom + 1] : null,
        );
        width += 32.0;
      } else {
        /// Odd cases
        column = OneProductCardColumn(
          product: _products[_oddCasesIndex(index)],
        );
      }
      return Container(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: column,
        ),
      );
    }).toList();
  }

  int _evenCasesIndex(int input) {
    // The operator ~/ is a cool one. It's the truncating division operator. It
    // divides the number and if there's a remainder / decimal, it cuts it off.
    // This is like dividing and then casting the result to int. Also, it's
    // functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    return (totalItems % 3 == 0)
        ? totalItems ~/ 3 * 2
        : (totalItems / 3).ceil() * 2 - 1;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: _BrowserScrollBehavior(),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: kIsWeb ? null : const EdgeInsets.fromLTRB(0, 34, 16, 44),
        physics: const AlwaysScrollableScrollPhysics(),
        children: _buildColumns(context),
      ),
    );
  }
}

class _BrowserScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => !kIsWeb
      ? super.dragDevices
      : {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        };
}
