import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:instagramtworecord/repo/helper/image_helper.dart';

class ImageNetworkRepository {
  Future<void> uploadImageNCreateNewPost(File originImage) async {
    try {
      final File resized = await compute(getResizedImage, originImage);
      originImage
          .length()
          .then((value) => print('original image size: $value'));
      resized.length().then((value) => print('resized image size: $value'));
      await Future.delayed(Duration(seconds: 3));
    } catch (e) {}
  }
}

ImageNetworkRepository imageNetworkRepository = ImageNetworkRepository();
