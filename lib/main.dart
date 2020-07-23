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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirebaseAuthState>.value(
      value: _firebaseAuthState,
      child: MaterialApp(
        home: Consumer<FirebaseAuthState>(builder: (BuildContext context,
            FirebaseAuthState firebaseAuthState, Widget child) {
          switch (firebaseAuthState.firebaseAuthStatus) {
            case FirebaseAuthStatus.signout:
              return AuthScreen();
            case FirebaseAuthStatus.signin:
              return HomePage();
            default:
              return MyProgressIndicator();
          }
        }),
        theme: ThemeData(primarySwatch: white),
      ),
    );
  }
}
