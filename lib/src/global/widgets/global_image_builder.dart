import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///[GlobalImageBuilder] builds required image from an image URL [src] or a [file]
/// You can also use SVGs as it automatically takes care of what widget to use depending on file or url.

class GlobalImageBuilder extends StatelessWidget {
  const GlobalImageBuilder(
      {super.key, this.src, this.fit, this.width, this.height, this.file});

  final String? src;
  final File? file;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      if (_isSvg(file!.path)) {
        return SvgPicture.file(file!,
            width: width, height: height, fit: fit ?? BoxFit.cover);
      }
      return Image.file(
        file!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => defaultImage(),
      );
    }

    if (src != null) {
      if (_isSvg(src!)) {
        return SvgPicture.network(
          src!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        );
      }

      return Image.network(
        src!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => defaultImage(),
      );
    }

    return defaultImage();
  }

  Widget defaultImage() {
    return Container(
      color: Colors.grey,
      height: height,
      width: width,
    );
  }

  bool _isSvg(String imageUrl) {
    Uri uri = Uri.parse(imageUrl);
    List<String> pathSegments = uri.pathSegments;
    if (pathSegments.isEmpty) {
      // No path segments found
    }

    String lastPathSegment = pathSegments.last;
    int dotIndex = lastPathSegment.lastIndexOf('.');
    if (dotIndex != -1) {
      return lastPathSegment.substring(dotIndex + 1) == 'svg';
    }
    return false;
  }
}
