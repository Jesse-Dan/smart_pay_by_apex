import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../enums.dart';



class ImageViewer extends StatelessWidget {
  const ImageViewer({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
    this.resizeMode = ImageResizeMode.cover,
  }) : super(key: key);

  final String imagePath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final ImageResizeMode resizeMode;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double? imageWidth;
        double? imageHeight;

        switch (resizeMode) {
          case ImageResizeMode.cover:
            if (width != null && height != null) {
              if (constraints.maxWidth / width! >
                  constraints.maxHeight / height!) {
                imageWidth = constraints.maxWidth;
                imageHeight = height! * imageWidth / width!;
              } else {
                imageHeight = constraints.maxHeight;
                imageWidth = width! * imageHeight / height!;
              }
            }
            break;
          case ImageResizeMode.contain:
            if (width != null && height != null) {
              if (constraints.maxWidth / width! <
                  constraints.maxHeight / height!) {
                imageWidth = constraints.maxWidth;
                imageHeight = height! * imageWidth / width!;
              } else {
                imageHeight = constraints.maxHeight;
                imageWidth = width! * imageHeight / height!;
              }
            }
            break;
          case ImageResizeMode.stretch:
            imageWidth = constraints.maxWidth;
            imageHeight = constraints.maxHeight;
            break;
        }

        Widget getImageWidget() {
          if (imagePath.endsWith('.svg')) {
            return SvgPicture.asset(
              imagePath,
              width: width,
              height: height,
              color: color,
              fit: fit,
            );
          } else if (imagePath.contains('http')) {
            return Image.network(
              imagePath,
              width: width,
              height: height,
              color: color,
              fit: fit,
            );
          } else {
            return Image.asset(
              imagePath,
              width: width,
              height: height,
              color: color,
              fit: fit,
            );
          }
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: SizedBox(
            width: width,
            height: height,
            child: getImageWidget(),
          ),
        );
      },
    );
  }
}
