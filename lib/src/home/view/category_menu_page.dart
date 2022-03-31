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

import 'package:shrine_mvc/src/model.dart' show AppStateModel, Category;

import 'package:shrine_mvc/src/view.dart'
    show L10n, kShrineBrown900, kShrinePink100, kShrinePink400;

///
class CategoryMenuPage extends StatelessWidget {
  ///
  const CategoryMenuPage({
    Key? key,
    required this.onCategoryTap,
  }) : super(key: key);

  ///
  final VoidCallback onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 40),
        color: kShrinePink100,
        child: ListView(
          children: Category.values
              .map((Category c) => _buildCategory(c, context))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCategory(Category category, BuildContext context) {
    //
    final String categoryString =
        category.toString().replaceAll('Category.', '').toUpperCase();

    final ThemeData theme = Theme.of(context);

    // Access the App's Model
    final model = AppStateModel();

    return GestureDetector(
      onTap: () {
        model.setCategory(category);
        onCategoryTap();
        model.refresh();
      },
      child: model.selectedCategory == category
          ? Column(
              children: <Widget>[
                const SizedBox(height: 16),
                L10n.t(
                  categoryString,
                  style: theme.textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
                Container(
                  width: 70,
                  height: 2,
                  color: kShrinePink400,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: L10n.t(
                categoryString,
                style: theme.textTheme.bodyText2!
                    .copyWith(color: kShrineBrown900.withAlpha(153)),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
