import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/common_size.dart';
import 'package:instagramtworecord/constants/screen_size.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: size.width,
          height: size.width,
          color: Colors.black,
        ),
        Expanded(
          child: OutlineButton(
            onPressed: () {},
            shape: CircleBorder(),
            borderSide: BorderSide(color: Colors.black12, width: 20),
          ),
        )
      ],
    );
  }
}
