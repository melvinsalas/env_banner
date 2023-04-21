import 'package:env_banner/env_banner_location.dart';
import 'package:flutter/material.dart';

class EnvDecoration {
  EnvDecoration({
    required this.opacity,
    required this.location,
    required this.color,
  });

  final double opacity;
  final EnvBannerLocation location;
  final Color color;

  BorderRadiusGeometry get _borderRadius {
    switch (location) {
      case EnvBannerLocation.topStart:
      case EnvBannerLocation.bottomStart:
        return const BorderRadius.horizontal(right: Radius.circular(8));
      case EnvBannerLocation.topEnd:
      case EnvBannerLocation.bottomEnd:
        return const BorderRadius.horizontal(left: Radius.circular(8));
    }
  }

  Decoration decoration() {
    return BoxDecoration(
      color: color.withOpacity(opacity),
      borderRadius: _borderRadius,
    );
  }
}
