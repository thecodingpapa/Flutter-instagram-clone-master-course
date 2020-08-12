import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagramtworecord/constants/firestore_keys.dart';

class PostModel {
  final String postKey;
  final String userKey;
  final String username;
  final String postImg;
  final List<dynamic> numOfLikes;
  final String caption;
  final String lastCommentor;
  final String lastComment;
  final DateTime lastCommentTime;
  final int numOfComments;
  final DateTime postTime;
  final DocumentReference reference;

  PostModel.fromMap(Map<String, dynamic> map, this.postKey, {this.reference})
      : userKey = map[KEY_USERKEY],
        username = map[KEY_USERNAME],
        postImg = map[KEY_POSTIMG],
        numOfLikes = map[KEY_NUMOFLIKES],
        caption = map[KEY_CAPTION],
        lastCommentor = map[KEY_LASTCOMMENTOR],
        lastComment = map[KEY_LASTCOMMENT],
        lastCommentTime = map[KEY_LASTCOMMENTTIME] == null
            ? DateTime.now().toUtc()
            : (map[KEY_LASTCOMMENTTIME] as Timestamp).toDate(),
        numOfComments = map[KEY_NUMOFCOMMENTS],
        postTime = map[KEY_POSTTIME] == null
            ? DateTime.now().toUtc()
            : (map[KEY_POSTTIME] as Timestamp).toDate();

  PostModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.documentID,
            reference: snapshot.reference);

  static Map<String, dynamic> getMapForCreatePost(
      {String userKey, String username, String caption}) {
    Map<String, dynamic> map = Map();
    map[KEY_USERKEY] = userKey;
    map[KEY_USERNAME] = username;
    map[KEY_POSTIMG] = "";
    map[KEY_NUMOFLIKES] = [];
    map[KEY_CAPTION] = caption;
    map[KEY_LASTCOMMENTOR] = "";
    map[KEY_LASTCOMMENT] = "";
    map[KEY_LASTCOMMENTTIME] = DateTime.now().toUtc();
    map[KEY_NUMOFCOMMENTS] = 0;
    map[KEY_POSTTIME] = DateTime.now().toUtc();
    return map;
  }
}
