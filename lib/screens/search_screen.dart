import 'package:flutter/material.dart';
import 'package:instagramtworecord/models/firestore/user_model.dart';
import 'package:instagramtworecord/repo/user_network_repository.dart';
import 'package:instagramtworecord/widgets/my_progress_indicator.dart';
import 'package:instagramtworecord/widgets/rounded_avatar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Follow/Unfollow'),
      ),
      body: StreamBuilder<List<UserModel>>(
          stream: userNetworkRepository.getAllUsersWithoutMe(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        UserModel userModel = snapshot.data[index];
                        return ListTile(
                          onTap: () {
                            setState(() {
//                          followings[index] = !followings[index];
                            });
                          },
                          leading: RoundedAvatar(),
                          title: Text(userModel.username),
                          subtitle:
                              Text('this is user bio of ${userModel.username}'),
                          trailing: Container(
                            height: 30,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              border:
                                  Border.all(color: Colors.blue, width: 0.5),
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
                      itemCount: snapshot.data.length));
            } else {
              return MyProgressIndicator();
            }
          }),
    );
  }
}
