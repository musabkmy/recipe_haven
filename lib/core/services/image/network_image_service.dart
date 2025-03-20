import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class NetworkImageService {
  // Future<String> getImageUrl(String url);
  Widget networkImageWidget(
    String imageUrl,
    Widget Function(BuildContext, ImageProvider<Object>) imageBuilder,
    double? height,
    double? width,
  );
}

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>) imageBuilder;
  final double? height;
  final double? width;

  const AppNetworkImage({
    required this.imageUrl,
    required this.imageBuilder,
    this.height,
    this.width,
    super.key,
  });
  static final _service = GetIt.instance<NetworkImageService>();

  @override
  Widget build(BuildContext context) {
    return _service.networkImageWidget(imageUrl, imageBuilder, height, width);
  }
}
