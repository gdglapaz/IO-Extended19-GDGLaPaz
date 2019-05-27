import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/shared_preferences/user_preferences.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class UserProfile extends StatelessWidget {

  UserPreferences prefs = UserPreferences();
  double sizeAvatar = 50.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(margin_xs),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl:  prefs.photoUrl,
          width: sizeAvatar,
          height: sizeAvatar,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
