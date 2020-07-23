import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/material_white.dart';
import 'package:instagramtworecord/home_page.dart';
import 'package:instagramtworecord/models/firebase_auth_state.dart';
import 'package:instagramtworecord/screens/auth_screen.dart';
import 'package:instagramtworecord/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuthState _firebaseAuthState = FirebaseAuthState();
  Widget _currentWidget;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirebaseAuthState>.value(
      value: _firebaseAuthState,
      child: MaterialApp(
        home: Consumer<FirebaseAuthState>(builder: (BuildContext context,
            FirebaseAuthState firebaseAuthState, Widget child) {
          switch (firebaseAuthState.firebaseAuthStatus) {
            case FirebaseAuthStatus.signout:
              _currentWidget = AuthScreen();
              break;
            case FirebaseAuthStatus.signin:
              _currentWidget = HomePage();
              break;
            default:
              _currentWidget = MyProgressIndicator();
          }

          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _currentWidget,
          );
        }),
        theme: ThemeData(primarySwatch: white),
      ),
    );
  }
}
