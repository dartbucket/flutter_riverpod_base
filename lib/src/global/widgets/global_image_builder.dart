import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///[GlobalImageBuilder] builds required image from an image URL [src] or a [file]
/// You can also use SVGs as it automatically takes care of what widget to use depending on file or url.

class GlobalImageBuilder extends StatelessWidget {
  const GlobalImageBuilder({
    super.key,
    this.src,
    this.fit,
    this.width,
    this.height,
    this.file,
  });

  final String? src;
  final File? file;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    // TODO: use an early return instead of nested ifs.
    if (file != null) {
      if (_isSvg(file!.path)) {
        return SvgPicture.file(
          file!,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
        );
      }

      // TODO: consider using sementic labels to describe your image.
      return Image.file(
        file!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => defaultImage(),
      );
    }

    // TODO: split this two into different methods they are confusing.
    // TODO: use an early return instead of nested ifs.
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

    // TODO: Avoid returning widgets from a function.
    return defaultImage();
  }

  // TODO: move this to a local stateless widget/.
  Widget defaultImage() {
    // TODO: container is expensive use a sizedbox and ColoredBox
    // ! Tip: if you need to expand use a limitedBox with a BoxConstraints.expand()
    //    LimitedBox(
    //   maxWidth: 0.0,
    //   maxHeight: 0.0,
    //   child: ConstrainedBox(constraints: const BoxConstraints.expand()),
    // );

    return Container(
      color: Colors.grey,
      height: height,
      width: width,
    );
  }

  bool _isSvg(String imageUrl) {
    Uri uri = Uri.parse(imageUrl);
    List<String> pathSegments = uri.pathSegments;
    // TODO: handle this case the code doesn't stop.
    if (pathSegments.isEmpty) {
      // No path segments found.
    }
    // TODO: it's not guaranteed that the last segment is the file name.
    // TODO: you can use lastOrNull.
    String lastPathSegment = pathSegments.last;
    // TODO: prefer using regex for patterns.
    int dotIndex = lastPathSegment.lastIndexOf('.');
    if (dotIndex != -1) {
      return lastPathSegment.substring(dotIndex + 1) == 'svg';
    }

    // TODO: you can use conditional instead. dotIndex != -1 && lastPathSegment.substring(dotIndex + 1) == 'svg';.
    return false;
  }
}
