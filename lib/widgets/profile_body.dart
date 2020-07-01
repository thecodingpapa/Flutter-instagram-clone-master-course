import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool selectedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              _username(),
              _userBio(),
              _editProfileBtn(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage('assets/images/grid.png'),
                        color: selectedLeft ? Colors.black : Colors.black26,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedLeft = true;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage('assets/images/saved.png'),
                        color: selectedLeft ? Colors.black26 : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedLeft = false;
                        });
                      },
                    ),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'this is what I believe!!',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
