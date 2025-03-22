import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show debugPrint show compute;
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/core/services/image/network_image_service.dart';
import 'package:recipe_haven/core/shared_layouts/app_loading_layout.dart';

@Injectable(as: NetworkImageService)
class NetworkImageServiceCachedImageImpl implements NetworkImageService {
  // Logger logger = Logger('NetworkImageServiceCachedImageImpl');

  @override
  Widget networkImageWidget(imageUrl, imageBuilder, height, width) {
    // logger.info('$imageUrl rebuilt');
    return CachedNetworkImage(
      key: ValueKey(imageUrl),
      imageUrl: imageUrl,
      height: height,
      width: width,
      maxWidthDiskCache: height?.toInt(),
      maxHeightDiskCache: width?.toInt(),
      fit: BoxFit.cover,
      imageBuilder: imageBuilder,
      errorWidget:
          (context, url, error) =>
              Text('can\'t be loaded.', style: context.bodySmall),
      progressIndicatorBuilder:
          (context, url, progress) =>
              AppLoadingLayout(value: progress.progress),
    );
  }

  // @override
  // Widget networkImageWidget(imageUrl, imageBuilder, height, width) {
  //   logger.info('$imageUrl rebuilt');

  //   return FutureBuilder(
  //     future: getImageUrl(imageUrl),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return SizedBox(
  //           height: height,
  //           width: width,
  //           child: const Center(child: CircularProgressIndicator()),
  //         );
  //       }
  //       if (snapshot.hasError || !snapshot.hasData) {
  //         return SizedBox(
  //           height: height,
  //           width: width,
  //           child: const Center(child: Icon(Icons.error, color: Colors.red)),
  //         );
  //       }
  //       return CachedNetworkImage(
  //         key: ValueKey(imageUrl),
  //         imageUrl: snapshot.data!,
  //         height: height,
  //         width: width,
  //         maxWidthDiskCache: height?.toInt(),
  //         maxHeightDiskCache: width?.toInt(),
  //         fit: BoxFit.cover,
  //         imageBuilder: imageBuilder,
  //         errorWidget:
  //             (context, url, error) =>
  //                 Text('can\'t be loaded.', style: context.bodySmall),
  //         progressIndicatorBuilder:
  //             (context, url, progress) =>
  //                 AppLoadingLayout(value: progress.progress),
  //       );
  //     },
  //   );
  // }

  // String _fetchImageUrl(String url) {
  //   return url; // Modify this logic if you need to fetch URLs differently.
  // }
}
