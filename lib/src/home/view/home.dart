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

import 'package:shrine_mvc/src/view.dart';

///
class HomePage extends StatefulWidget {
  ///
  const HomePage({
    this.expandingBottomSheet,
    this.backdrop,
    Key? key,
  }) : super(key: key);

  ///
  final ExpandingBottomSheet? expandingBottomSheet;

  ///
  final Backdrop? backdrop;

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      value: 1,
    );
  }

  late AnimationController aniController;
  // Flag to dispose only once.
  bool animaDisposed = false;

  @override
  void dispose() {
    if (aniController.isAnimating) {
      aniController.stop();
    }
    if (!animaDisposed) {
      animaDisposed = true;
      //Errors if called more than once?!
//todo: It's still called for some reason?!
//      aniController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SetState(builder: (context, _) {
      final Widget child = widget.expandingBottomSheet ??
          ExpandingBottomSheet(hideController: aniController);
      return Stack(
        children: <Widget>[
          Backdrop(
            frontLayer: const ProductPage(),
            backLayer: CategoryMenuPage(
              onCategoryTap: () => aniController.forward(),
            ),
            frontTitle: L10n.t('Shrine'),
            backTitle: L10n.t('Menu'),
            controller: aniController,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: child,
          ),
        ],
      );
    });
  }
}
