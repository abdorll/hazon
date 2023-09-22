import 'package:flutter/material.dart';
import 'package:hazon/utils/images.dart';

@immutable
class HazonLogo extends StatelessWidget {
  final double? size;
  const HazonLogo({this.size = 70, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageOf.logo,
      height: size!,
    );
  }
}
