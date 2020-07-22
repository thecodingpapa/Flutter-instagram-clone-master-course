import 'package:flutter/material.dart';
import 'package:instagramtworecord/widgets/rounded_avatar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: RoundedAvatar(),
                title: Text('username $index'),
                subtitle: Text('user bio number $index'),
                trailing: Container(
                  height: 30,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    border: Border.all(color: Colors.red, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'following',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
              );
            },
            itemCount: 30));
  }
}
