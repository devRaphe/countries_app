import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// An extension used to enhance the [Widget] class.
extension WidgetExtension on Widget {
  /// Adds a borderRadius to the widget.
  Widget get defaultBorderRadius => ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        child: this,
      );

  /// Allows to add custom borderRadius
  Widget borderRadius(BorderRadius radius) => ClipRRect(
        borderRadius: radius,
        child: this,
      );

  /// Make the widget clickable.
  /// Provides a callback when the widget is clicked.
  Widget touchable(VoidCallback onTap, {Color? splashColor}) => Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splashColor,
          onTap: onTap,
          child: this,
        ),
      );

  ///This extension adds padding to the given widget.
  ///It has a default padding for [24.w] horizontally and [16.h] vertically.
  Widget withPadding(EdgeInsetsGeometry? padding) => Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 16.h,
            ),
        child: this,
      );
}
