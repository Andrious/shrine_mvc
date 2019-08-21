import 'package:flutter/material.dart';

import 'package:shrine_mvc/src/view.dart';

//void main() => runApp(ShrineApp());


void main() => runApp(MyApp());

class MyApp extends App{
  @override
  createView() => ShrineApp();
}