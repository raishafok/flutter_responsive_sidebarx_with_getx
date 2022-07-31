import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.gradient,
    this.colors,
    this.semanticLabel,
    this.textDirection,
  })  : assert(icon != null),
        super(key: key);

  /// The icon to display. The available icons are described in
  /// [FontAwesomeIcons].
  final IconData? icon;

  /// The font size of the icon.
  ///
  /// Defaults to the current [IconTheme] size, if any. If there is no
  /// [IconTheme], or it does not specify an explicit size, then it defaults to
  /// 24.0.
  ///
  /// If this [FaIcon] is being placed inside an [IconButton], then use
  /// [IconButton.iconSize] instead, so that the [IconButton] can make the
  /// splash area the appropriate size as well. The [IconButton] uses an
  /// [IconTheme] to pass down the size to the [FaIcon].
  final double? size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the current white to gradient, if any.
  ///
  /// The given color will be adjusted by the opacity of the current
  /// [IconTheme], if any.
  final Color? color;

  /// The gradient to use when drawing the icon.
  ///
  /// Defaults to the current
  /// LinearGradient(
  ///    begin: Alignment.bottomCenter,
  ///    end: Alignment.topCenter,
  ///    colors: AppColors.linear1,
  /// )
  ///
  /// For apply gradient color, color must be set to White (#FFFFFFFF)
  final Gradient? gradient;
  final List<Color>? colors;

  /// Semantic label for the icon.
  ///
  /// Announced in accessibility modes (e.g TalkBack/VoiceOver).
  /// This label does not show in the UI.
  ///
  /// See also:
  ///
  ///  * [Semantics.label], which is set to [semanticLabel] in the underlying
  ///    [Semantics] widget.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  ///
  /// If this is null, the ambient [Directionality] is used instead.
  ///
  /// Some icons follow the reading direction. For example, "back" buttons point
  /// left in left-to-right environments and right in right-to-left
  /// environments. Such icons have their [IconData.matchTextDirection] field
  /// set to true, and the [FaIcon] widget uses the [textDirection] to determine
  /// the orientation in which to draw the icon.
  ///
  /// This property has no effect if the [icon]'s [IconData.matchTextDirection]
  /// field is false, but for consistency a text direction value must always be
  /// specified, either directly using this property or using [Directionality].
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      key: key,
      shaderCallback: (bounds) => (gradient ??
              LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: colors ?? [Colors.red, Colors.green],
              ))
          .createShader(bounds),
      child: Icon(
        icon,
        color: color ?? AppColors.white,
        semanticLabel: semanticLabel,
        size: size,
        textDirection: textDirection,
      ),
    );
  }
}
