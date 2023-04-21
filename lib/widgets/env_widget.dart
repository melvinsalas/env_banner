import 'package:env_banner/widgets/env_decoration.dart';
import 'package:env_banner/env_banner_location.dart';
import 'package:env_banner/widgets/env_position.dart';
import 'package:flutter/material.dart';

/// Displays a message above the corner of another widget.
///
/// Useful for showing the excecution mode of and app (e.g. DEV, STG.), also
/// to display the version of the app (e.g. 1.0.0).
class EnvBanner extends StatelessWidget {
  /// Create a EnvBanner
  ///
  /// The [primary] and [child] parameters must not be null.
  const EnvBanner({
    super.key,
    required this.primary,
    required this.child,
    this.secondary,
    this.color = Colors.red,
    this.textColor = Colors.white,
    this.opacity = 0.75,
    this.fontSize = 12,
    this.location = EnvBannerLocation.topEnd,
    this.ignoreMediaPadding = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  /// The widget to show behind the banner.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// The message to show in the banner.
  ///
  /// If [secondary] is not null, the [primary] text will be bold.
  final String primary;

  /// The secondary message to show in the banner.
  final String? secondary;

  /// The color of the banner.
  final Color color;

  /// The opacity of the banner.
  final double opacity;

  /// The font size of the text shown in the banner.
  final double fontSize;

  /// The text color of the text shown in the banner.
  final Color textColor;

  /// Where to show the banner (e.g. the upper right corner).
  final EnvBannerLocation location;

  /// Ignore the media padding.
  ///
  /// This is used when the banner is used as a decoration for a widget.
  final bool ignoreMediaPadding;

  /// The padding of the banner.
  final EdgeInsetsGeometry padding;

  TextStyle get _baseTextStyle => TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      );

  TextStyle get _boldTextStyle =>
      _baseTextStyle.copyWith(fontWeight: FontWeight.bold);

  Decoration get _decoration => EnvDecoration(
        opacity: opacity,
        location: location,
        color: color,
      ).decoration();

  List<Widget> getTexts() {
    List<Widget> texts = [];

    final primaryStyle = secondary == null ? _baseTextStyle : _boldTextStyle;
    texts.add(Text(primary, style: primaryStyle));

    if (secondary != null) {
      texts.add(const SizedBox(width: 4));
      texts.add(Text(secondary!, style: _baseTextStyle));
    }

    return texts;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        EnvPosition(
          ignoreMediaPadding: ignoreMediaPadding,
          location: location,
          child: IgnorePointer(
            child: Container(
              decoration: _decoration,
              padding: padding,
              child: Row(mainAxisSize: MainAxisSize.min, children: getTexts()),
            ),
          ),
        ),
      ],
    );
  }
}
