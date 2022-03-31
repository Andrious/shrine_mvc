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

import 'package:flutter/material.dart';

import 'package:intl/intl.dart' show NumberFormat;

// import 'package:scoped_model/scoped_model.dart';

import 'package:shrine_mvc/src/model.dart' show AppStateModel, Product;

import 'package:shrine_mvc/src/view.dart'
    show
        ExpandingBottomSheet,
        SetState,
        kShrineBrown600,
        kShrineBrown900,
        kShrinePink50;

const double _leftColumnWidth = 60;

///
class ShoppingCartPage extends StatefulWidget {
  ///
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Widget> _createShoppingCartRows() {
    //}AppStateModel model) {
    return AppStateModel()
        .productsInCart
        .keys
        .map(
          (int id) => ShoppingCartRow(
            product: AppStateModel().getProductById(id),
            quantity: AppStateModel().productsInCart[id]!,
            onPressed: () {
              AppStateModel().removeItemFromCart(id);
            },
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData localTheme = Theme.of(context);

    return Scaffold(
      backgroundColor: kShrinePink50,
      body: SafeArea(
        child: SetState(
            builder: (context, anItem) => Stack(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: _leftColumnWidth,
                              child: IconButton(
                                icon: const Icon(Icons.keyboard_arrow_down),
                                onPressed: () =>
                                    ExpandingBottomSheet.of(context).close(),
                              ),
                            ),
                            Text(
                              'CART',
                              style: localTheme.textTheme.subtitle1!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 16),
                            Text('${AppStateModel().totalCartQuantity} ITEMS'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          children: _createShoppingCartRows(), //model),
                        ),
                        const ShoppingCartSummary(), //model: model),
                        const SizedBox(height: 100),
                      ],
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: ElevatedButton(
                        // shape: const BeveledRectangleBorder(
                        //   borderRadius:
                        //       BorderRadius.all(Radius.circular(7.0)),
                        // ),
                        // color: kShrinePink100,
                        // splashColor: kShrineBrown600,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text('CLEAR CART'),
                        ),
                        onPressed: () {
                          AppStateModel().clearCart();
                          ExpandingBottomSheet.of(context).close();
                        },
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}

///
class ShoppingCartSummary extends StatelessWidget {
  ///
  const ShoppingCartSummary({Key? key}) : super(key: key); //{this.model});

//  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    final TextStyle smallAmountStyle =
        Theme.of(context).textTheme.bodyText1!.copyWith(color: kShrineBrown600);
    final TextStyle? largeAmountStyle = Theme.of(context).textTheme.headline4;
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      decimalDigits: 2,
      locale: Localizations.localeOf(context).toString(),
    );
    final model = AppStateModel();
    model.widgetInherited(context);
    return Row(
      children: <Widget>[
        const SizedBox(width: _leftColumnWidth),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('TOTAL'),
                    ),
                    Text(
                      formatter.format(model.totalCost),
                      style: largeAmountStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('Subtotal:'),
                    ),
                    Text(
                      formatter.format(model.subtotalCost),
                      style: smallAmountStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('Shipping:'),
                    ),
                    Text(
                      formatter.format(model.shippingCost),
                      style: smallAmountStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('Tax:'),
                    ),
                    Text(
                      formatter.format(model.tax),
                      style: smallAmountStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

///
class ShoppingCartRow extends StatelessWidget {
  ///
  const ShoppingCartRow({
    Key? key,
    required this.product,
    required this.quantity,
    required this.onPressed,
  }) : super(key: key);

  ///
  final Product product;

  ///
  final int quantity;

  ///
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      decimalDigits: 0,
      locale: Localizations.localeOf(context).toString(),
    );
    final ThemeData localTheme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        key: ValueKey<int>(product.id),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: _leftColumnWidth,
            child: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: onPressed,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/${product.assetName}',
//                        package: product.assetPackage,
                        fit: BoxFit.cover,
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text('Quantity: $quantity'),
                                ),
                                Text('x ${formatter.format(product.price)}'),
                              ],
                            ),
                            Text(
                              product.name,
                              style: localTheme.textTheme.subtitle1!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: kShrineBrown900,
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
