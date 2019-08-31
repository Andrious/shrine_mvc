///
/// Copyright (C) 2019 Andrious Solutions
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
///          Created  17 Aug 2019
///
///

import 'package:flutter/material.dart';

import 'package:shrine_mvc/src/home/view/expanding_bottom_sheet.dart';

import 'package:shrine_mvc/src/model.dart'
    show AppStateModel, I18n, I18nDelegate;

import 'package:shrine_mvc/src/view.dart'
    show
        App,
        AppView,
        CutCornersBorder,
        HomePage,
        LoginPage,
        kShrineBackgroundWhite,
        kShrineBrown900,
        kShrineErrorRed,
        kShrinePink100,
        kShrinePink50,
        kShrineSurfaceWhite;


class ShrineApp extends AppView with SingleTickerProviderStateMixin {
  // Controller to coordinate both the opening/closing of backdrop and sliding
  // of expanding bottom sheet
  static AnimationController aniController;

  ShrineApp()
      : super(
          home: HomePage(),
          title: I18n.s('Shrine'),
          initialRoute: '/login',
          onGenerateRoute: _getRoute,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            const I18nDelegate(),
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('fr', ''),
            const Locale('es', ''),
          ],
        );

  @override
  void initState() {
    super.initState();
    object = AppStateModel();
    aniController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      value: 1.0,
    );
  }

  // Copy the platform from the main theme in order to support platform
  // toggling from the Gallery options menu.
  @override
  ThemeData onTheme() =>
      _kShrineTheme.copyWith(platform: Theme.of(App.context).platform);
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }
  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginPage(),
    fullscreenDialog: true,
  );
}

final ThemeData _kShrineTheme = _buildShrineTheme();

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kShrineBrown900);
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: kShrineColorScheme,
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: kShrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    inputDecorationTheme:
        const InputDecorationTheme(border: CutCornersBorder()),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

const ColorScheme kShrineColorScheme = ColorScheme(
  primary: kShrinePink100,
  primaryVariant: kShrineBrown900,
  secondary: kShrinePink50,
  secondaryVariant: kShrineBrown900,
  surface: kShrineSurfaceWhite,
  background: kShrineBackgroundWhite,
  error: kShrineErrorRed,
  onPrimary: kShrineBrown900,
  onSecondary: kShrineBrown900,
  onSurface: kShrineBrown900,
  onBackground: kShrineBrown900,
  onError: kShrineSurfaceWhite,
  brightness: Brightness.light,
);

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(fontWeight: FontWeight.w500),
        title: base.title.copyWith(fontSize: 18.0),
        caption:
            base.caption.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
        body2: base.body2.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
        button:
            base.button.copyWith(fontWeight: FontWeight.w500, fontSize: 14.0),
      )
      .apply(
        fontFamily: 'Raleway',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
