import 'package:shrine_mvc/src/view.dart';

void main() => runApp(MyApp());

///
class MyApp extends AppStatefulWidget {
  ///
  // Global key to 'keep' the State object and just move around the Widget tree
  MyApp({Key? key}) : super(key: key ?? GlobalKey(debugLabel: 'shrine'));

  @override
  AppState createAppState() => ShrineApp();
}
