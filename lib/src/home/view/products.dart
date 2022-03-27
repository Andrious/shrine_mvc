///
/// Copyright (C) 2022 Andrious Solutions
///
/// This program is free software; you can redistribute it and/or
/// modify it under the terms of the GNU General Public License
/// as published by the Free Software Foundation; either version 3
/// of the License, or any later version.
///
/// You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
///          Created  14 March 2022
///
///

import 'package:shrine_mvc/src/model.dart';

import 'package:shrine_mvc/src/view.dart';

///
class ProductPage extends StatefulWidget {
  ///
  const ProductPage({Key? key, this.category = Category.all}) : super(key: key);

  ///
  final Category category;

  @override
  State<StatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends StateMVC<ProductPage> {
  _ProductPageState() : super(AppStateModel());
  @override
  Widget build(context) {
    widgetInherited(context);
    final model = controller as AppStateModel;
    model.loadProducts();
    return AsymmetricView(products: model.getProducts());
  }
}

/// The InheritedWidget assigned 'dependent' child widgets.
class ShineAppInheritedWidget extends InheritedWidget {
  ///
  const ShineAppInheritedWidget({Key? key, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(oldWidget) => true;
}
