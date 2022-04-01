import 'package:shrine_mvc/src/controller.dart' as c;

import 'package:shrine_mvc/src/model.dart' show AppStateModel, AppTrs;

import 'package:shrine_mvc/src/view.dart';

///
class ShrineApp extends AppState {
  ///
  ShrineApp()
      : super(
          con: c.ShrineApp(),
          home: const HomePage(),
          object: AppStateModel(),
          onGenerateTitle: (context) => 'Shrine'.tr,
          useInheritedMediaQuery: kIsWeb,
          initialRoute: '/login',
          onGenerateRoute: _getRoute,
          debugShowCheckedModeBanner: false,
          localeResolutionCallback: AppTrs.localeResolutionCallback,
          supportedLocales: AppTrs.supportedLocales,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            L10n.delegate!,
          ],
        );

  // Copy the platform from the main theme in order to support platform
  // toggling from the Gallery options menu.
  @override
  ThemeData onTheme() =>
      _kShrineTheme.copyWith(platform: Theme.of(App.context!).platform);

  @override
  Locale onLocale() {
    final _locale = Prefs.getString('locale', 'en_US');
    return L10n.toLocale(_locale)!;
  }
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }
  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => const LoginPage(),
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
    primaryColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
//    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: kShrineColorScheme,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    inputDecorationTheme:
        const InputDecorationTheme(border: CutCornersBorder()),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

///
const ColorScheme kShrineColorScheme = ColorScheme(
  primary: kShrinePink100,
  primaryContainer: kShrineBrown900,
  secondary: kShrinePink50,
  secondaryContainer: kShrineBrown900,
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
        headline1: base.headline5?.copyWith(fontWeight: FontWeight.w500),
        subtitle1: base.headline6?.copyWith(fontSize: 18),
        caption:
            base.caption?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
        bodyText2:
            base.bodyText2?.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
        button:
            base.button?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
      )
      .apply(
        fontFamily: 'Raleway',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
