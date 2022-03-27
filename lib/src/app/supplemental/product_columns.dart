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

import 'package:shrine_mvc/src/model.dart' show Product;

import 'package:shrine_mvc/src/view.dart';

import 'package:shrine_mvc/src/app/supplemental/product_card.dart'
    show ProductCard;

///
class TwoProductCardColumn extends StatelessWidget {
  ///
  const TwoProductCardColumn({
    Key? key,
    required this.bottom,
    this.top,
  })  : assert(bottom != null),
        super(key: key);

  ///
  final Product? bottom, top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const double spacerHeight = 44;

      final double heightOfCards =
          (constraints.biggest.height - spacerHeight) / 2.0;
      final double availableHeightForImages =
          heightOfCards - ProductCard.kTextBoxHeight;
      // Ensure the cards take up the available space as long as the screen is
      // sufficiently tall, otherwise fallback on a constant aspect ratio.
      final double imageAspectRatio = availableHeightForImages >= 0.0
          ? constraints.biggest.width / availableHeightForImages
          : 49.0 / 33.0;

      return ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 28),
            child: top != null
                ? ProductCard(
                    imageAspectRatio: imageAspectRatio,
                    product: top!,
                    isOnWeb: kIsWeb,
                  )
                : SizedBox(
                    height: heightOfCards > 0 ? heightOfCards : spacerHeight,
                  ),
          ),
          const SizedBox(height: spacerHeight),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 28),
            child: ProductCard(
              imageAspectRatio: imageAspectRatio,
              product: bottom!,
            ),
          ),
        ],
      );
    });
  }
}

///
class OneProductCardColumn extends StatelessWidget {
  ///
  const OneProductCardColumn({Key? key, required this.product})
      : super(key: key);

  ///
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      reverse: true,
      children: <Widget>[
        const SizedBox(
          height: 40,
        ),
        ProductCard(
          product: product,
        ),
      ],
    );
  }
}
