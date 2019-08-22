import 'package:flutter/material.dart' show runApp;

import 'package:shrine_mvc/src/view.dart' show App, ShrineApp;

//void main() => runApp(ShrineApp());

void main() => runApp(MyApp());

class MyApp extends App {
  @override
  createView() => ShrineApp();
}
