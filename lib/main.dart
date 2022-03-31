import 'package:shrine_mvc/src/view.dart';

void main() {
//  MyApp? app;
//   return runApp(
//     DevicePreview(
//       builder: (context) => app ??= MyApp(),
//       enabled: kIsWeb,
// //      isToolbarVisible: false,
//       devices: Devices.all,
//       storage: DevicePreviewStorage.none(),
//     ),
//   );
  // @override  <---- in app.dart and in view.dart
  // c.TransitionBuilder? onBuilder() => kIsWeb ? DevicePreview.appBuilder : null;

  return runApp(MyApp());
}

///
class MyApp extends AppStatefulWidget {
  ///
  // Global key to 'keep' the State object and just move around the Widget tree
  MyApp({Key? key}) : super(key: key ?? GlobalKey(debugLabel: 'shrine'));

  @override
  AppState createAppState() => ShrineApp();
}
