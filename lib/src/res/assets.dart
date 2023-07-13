import 'package:flutter_riverpod_base/src/res/base.dart';


/// Contains all the paths of image used across the project.
/// Every image path variable name must contain a name and its extension.
/// example :
///
/// for an image with name avatar.png,
/// a suitable variable can be [avatarImagePng].
/// ```dart
/// static const sampleImagePng = "$_base/image.png";
/// ```
/// can be used by doing
/// ```dart
/// ImageAssets.sampleImagePng
/// ```
class ImageAssets{
  static const _base = BasePaths.baseImagePath;

  static const sampleImagePath = "$_base/image.png";

  static const profileImageJpeg = "$_base/profile.jpeg";
}

class AnimationAssets{
  /// Contains all the paths of animations used across the project.
}

class PlaceholderAssets {
  static const _base = BasePaths.basePlaceholderPath;

  static const carouselCardJpeg = "$_base/carousel_placehoder.jpeg";
}