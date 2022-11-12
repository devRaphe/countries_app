// ignore_for_file: use_key_in_widget_constructors, public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_dimensions.dart';

class CountriesSpacing extends StatelessWidget {
  const CountriesSpacing.empty()
      : width = CountriesDimensions.zero,
        height = CountriesDimensions.zero;
  CountriesSpacing.largeWidth() : this.width(CountriesDimensions.large.w);
  CountriesSpacing.bigWidth() : this.width(CountriesDimensions.big.w);
  CountriesSpacing.mediumWidth() : this.width(CountriesDimensions.medium.w);
  CountriesSpacing.smallWidth() : this.width(CountriesDimensions.small.w);
  CountriesSpacing.tinyWidth() : this.width(CountriesDimensions.tiny.w);
  CountriesSpacing.largeHeight() : this.height(CountriesDimensions.large.h);
  CountriesSpacing.bigHeight() : this.height(CountriesDimensions.big.h);
  CountriesSpacing.mediumHeight() : this.height(CountriesDimensions.medium.h);
  CountriesSpacing.smallHeight() : this.height(CountriesDimensions.small.h);

  CountriesSpacing.tinyHeight() : this.height(CountriesDimensions.tiny.h);

  const CountriesSpacing.width(this.width) : height = CountriesDimensions.zero;

  const CountriesSpacing.height(this.height) : width = CountriesDimensions.zero;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
