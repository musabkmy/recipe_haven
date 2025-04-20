import 'package:flutter/material.dart';
import 'package:recipe_haven/core/shared_layouts/app_network_circular_avatar.dart';

class BuildProfilePic extends StatelessWidget {
  const BuildProfilePic({
    super.key,
    required this.name,
    required this.profilePic,
  });
  final double _profileImageSize = 42;
  final String? profilePic;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _profileImageSize,
      child: AppNetworkCircularAvatar(
        imageUrl: profilePic,
        name: name,
        maxSize: _profileImageSize,
      ),
    );
  }
}
