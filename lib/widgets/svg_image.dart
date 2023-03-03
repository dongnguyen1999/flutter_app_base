import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  const SvgImage(this.name,
      {Key? key,
      this.width,
      this.height,
      this.color,
      this.alignment = Alignment.center,
      this.fit = BoxFit.contain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name,
      width: width,
      height: height,
      alignment: alignment,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      fit: fit,
    );
  }
}
