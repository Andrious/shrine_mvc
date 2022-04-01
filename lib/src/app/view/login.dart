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
class LoginPage extends StatefulWidget {
  ///
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const BackButtonIcon(),
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: () {
              // The login screen is immediately displayed on top of the Shrine
              // home screen using onGenerateRoute and so rootNavigator must be
              // set to true in order to get out of Shrine completely.
              //             Navigator.of(context, rootNavigator: true).pop();
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: <Widget>[
              const SizedBox(height: 80),
              Column(
                children: <Widget>[
                  Image.asset('assets/diamond.png'),
                  const SizedBox(height: 16),
                  Text(
                    'SHRINE'.tr,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              const SizedBox(height: 120),
              PrimaryColorOverride(
                color: kShrineBrown900,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username'.tr,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              PrimaryColorOverride(
                color: kShrineBrown900,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password'.tr,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('Login is disabled. Tap any button to continue.'.tr),
              const SizedBox(height: 2),
              Wrap(
                children: <Widget>[
                  ButtonBar(
                    children: <Widget>[
                      ElevatedButton(
                        child: Text('Cancel'.tr),
                        onPressed: () {
                          Navigator.pop(context);
                          //              Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                      ElevatedButton(
                        child: Text('Next'.tr),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

///
class PrimaryColorOverride extends StatelessWidget {
  ///
  const PrimaryColorOverride(
      {Key? key, required this.color, required this.child})
      : super(key: key);

  ///
  final Color color;

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: color),
      child: child,
    );
  }
}
