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
import 'package:scoped_model/scoped_model.dart';

import 'package:shrine_mvc/src/view.dart';

import 'package:shrine_mvc/src/home/view/backdrop.dart';
import 'package:shrine_mvc/src/home/view/expanding_bottom_sheet.dart';
import 'package:shrine_mvc/src/home/view/category_menu_page.dart';

import 'package:shrine_mvc/src/home/model/app_state_model.dart';
import 'package:shrine_mvc/src/home/model/product.dart';
import 'package:shrine_mvc/src/app/supplemental/asymmetric_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({this.category = Category.all});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SetState(
        builder: (context) =>
            AsymmetricView(products: AppStateModel().getProducts()));
//    return ScopedModelDescendant<AppStateModel>(
//        builder: (BuildContext context, Widget child, AppStateModel model) {
//      return AsymmetricView(products: model.getProducts());
//    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    this.expandingBottomSheet,
    this.backdrop,
    Key key,
  }) : super(key: key);

  final ExpandingBottomSheet expandingBottomSheet;
  final Backdrop backdrop;

  @override
  Widget build(BuildContext context) {
    AppStateModel(App.state).loadProducts();
    Widget child = expandingBottomSheet ??
        ExpandingBottomSheet(hideController: ShrineApp.aniController);

    return Stack(
      children: <Widget>[
        Backdrop(
          frontLayer: const ProductPage(),
          backLayer: CategoryMenuPage(
              onCategoryTap: () => ShrineApp.aniController.forward()),
          frontTitle: const Text('SHRINE'),
          backTitle: const Text('MENU'),
          controller: ShrineApp.aniController,
        ),
        Align(child: child, alignment: Alignment.bottomRight),
      ],
    );
  }
}
