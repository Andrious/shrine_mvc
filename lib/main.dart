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
  MyApp({Key? key}) : super(key: key);

  @override
  AppState createAppState() => ShrineApp();
}
