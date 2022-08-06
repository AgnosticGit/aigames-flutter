import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGIcons {
  const SVGIcons({this.color, this.width, this.height});

  final Color? color;
  final double? width;
  final double? height;

  static const _rootPath = 'assets/icons/';

  static const _filePaths = {
    'arrowTopPath': '${_rootPath}arrow_top.svg',
  };

  static Future<void> precacheAllIcons() async {
    final decoder = SvgPicture.svgStringDecoderBuilder;

    _filePaths.forEach((key, value) async {
      await precachePicture(ExactAssetPicture(decoder, value), null);
    });
  }

  SvgPicture get arrowTop => SvgPicture.asset(
        _filePaths['arrowTopPath']!,
        color: color,
        width: width,
        height: height,
      );
}
