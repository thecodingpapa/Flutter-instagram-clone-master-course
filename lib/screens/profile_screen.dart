import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: <Widget>[_appbar()],
        ),
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 44,
        ),
        Expanded(
            child: Text(
          'The Coding Papa',
          textAlign: TextAlign.center,
        )),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        )
      ],
    );
  }
}
