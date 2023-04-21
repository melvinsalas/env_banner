import 'package:env_banner/env_banner_location.dart';
import 'package:flutter/material.dart';

class EnvPosition extends StatelessWidget {
  const EnvPosition({
    super.key,
    required this.location,
    required this.child,
    required this.ignoreMediaPadding,
  });

  final EnvBannerLocation location;
  final Widget child;
  final bool ignoreMediaPadding;

  @override
  Widget build(BuildContext context) {
    var topPadding = 0.0;
    var bottomPadding = 0.0;

    if (!ignoreMediaPadding) {
      topPadding = MediaQuery.of(context).viewPadding.top;
      bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    }

    switch (location) {
      case EnvBannerLocation.topStart:
        return Positioned(
          left: 0,
          top: topPadding,
          child: child,
        );
      case EnvBannerLocation.topEnd:
        return Positioned(
          right: 0,
          top: topPadding,
          child: child,
        );
      case EnvBannerLocation.bottomStart:
        return Positioned(
          left: 0,
          bottom: bottomPadding,
          child: child,
        );
      case EnvBannerLocation.bottomEnd:
        return Positioned(
          right: 0,
          bottom: bottomPadding,
          child: child,
        );
    }
  }
}
