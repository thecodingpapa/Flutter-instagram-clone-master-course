import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:instagramtworecord/models/firestore/user_model.dart';

class UserModelState extends ChangeNotifier {
  UserModel _userModel;
  StreamSubscription<UserModel> _currentStreamSub;
  UserModel get userModel => _userModel;
  StreamSubscription<UserModel> get currentStreamSub => _currentStreamSub;

  set userModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  set currentStreamSub(StreamSubscription<UserModel> currentStreamSub) =>
      _currentStreamSub = currentStreamSub;

  clear() {
    if (_currentStreamSub != null) _currentStreamSub.cancel();
    _currentStreamSub = null;
    _userModel = null;
  }
}
