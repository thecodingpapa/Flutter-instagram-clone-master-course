import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/common_size.dart';

class RoundedAvatar extends StatelessWidget {
  const RoundedAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/100',
        width: avatar_size,
        height: avatar_size,
      ),
    );
  }
}
