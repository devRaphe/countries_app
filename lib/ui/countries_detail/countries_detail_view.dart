import 'package:cached_network_image/cached_network_image.dart';
import 'package:countries_app/models/country.dart';
import 'package:countries_app/ui/shared/dumb_widgets/spacing.dart';
import 'package:countries_app/ui/shared/dumb_widgets/statusbar.dart';
import 'package:countries_app/ui/shared/smart_widgets/webview_loader/webview_loader_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../core/extensions/string_extension.dart';
import '../../core/extensions/widget_extension.dart';
import 'countries_detail_viewmodel.dart';

/// This widget displays more details about a countries.
class CountriesDetailView extends HookWidget {
  /// Default constructor with a required named parameter [countryToView].
  const CountriesDetailView({
    super.key,
    required this.countryToView,
  });

  ///
  final Country countryToView;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return ViewModelBuilder<CountriesDetailViewModel>.reactive(
      viewModelBuilder: CountriesDetailViewModel.new,
      builder: (
        BuildContext context,
        CountriesDetailViewModel model,
        Widget? child,
      ) {
        return Statusbar(
          child: Scaffold(
            appBar: AppBar(
              title: Text(countryToView.commonName),
              titleTextStyle: Theme.of(context).textTheme.headline3?.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
            body: OrientationBuilder(
              builder: (context, orientation) => ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _MiniPageView(
                    height: orientation == Orientation.portrait ? 300 : 500,
                    countryToView: countryToView,
                    pageController: pageController,
                  ).defaultBorderRadius,
                  CountriesSpacing.largeHeight(),
                  if (orientation == Orientation.portrait)
                    _PortraitDetailsView(countryToView: countryToView)
                  else
                    _LandscapeDetailsView(countryToView: countryToView),
                ],
              ).withPadding(),
            ),
          ),
        );
      },
    );
  }
}

class _LandscapeDetailsView extends StatelessWidget {
  const _LandscapeDetailsView({
    required this.countryToView,
  });

  final Country countryToView;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
      ),
      children: [
        _CountriesInfoSection1(countryToView: countryToView),
        _CountriesInfoSection2(countryToView: countryToView),
        _CountriesInfoSection3(countryToView: countryToView),
        _CountriesInfoSection4(countryToView: countryToView),
      ],
    );
  }
}

class _PortraitDetailsView extends StatelessWidget {
  const _PortraitDetailsView({
    required this.countryToView,
  });

  final Country countryToView;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CountriesSpacing.mediumHeight(),
        _CountriesInfoSection1(countryToView: countryToView),
        CountriesSpacing.largeHeight(),
        _CountriesInfoSection2(countryToView: countryToView),
        CountriesSpacing.largeHeight(),
        _CountriesInfoSection3(countryToView: countryToView),
        CountriesSpacing.largeHeight(),
        _CountriesInfoSection4(countryToView: countryToView),
      ],
    );
  }
}

class _MiniPageView extends StatelessWidget {
  const _MiniPageView({
    required this.countryToView,
    required this.pageController,
    required this.height,
  });

  final double height;

  final Country countryToView;

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: SizedBox(
        height: 200.h,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [
                CachedNetworkImage(
                  imageUrl: countryToView.flagImageUrl,
                  fit: BoxFit.fill,
                ),
                WebViewLoader(
                  url: countryToView.googleMapUrl,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 2,
                effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).colorScheme.surface,
                  dotColor: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
            ).withPadding(
              EdgeInsets.only(bottom: 10.w),
            ),
            _ArrowButtons(pageController: pageController)
          ],
        ),
      ),
    );
  }
}

class _ArrowButtons extends StatelessWidget {
  const _ArrowButtons({
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: const Icon(Icons.arrow_back_ios)
                .withPadding(EdgeInsets.all(8.w)),
          ).touchable(
            () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: const Icon(Icons.arrow_forward_ios)
                .withPadding(EdgeInsets.all(8.w)),
          ).touchable(
            () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
      ).withPadding(
        EdgeInsets.symmetric(horizontal: 10.w),
      ),
    );
  }
}

class _CountriesInfoSection4 extends StatelessWidget {
  const _CountriesInfoSection4({
    required this.countryToView,
  });

  final Country countryToView;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CountryInfoBuilder(
          infoKey: 'Time zone',
          infoValue: countryToView.timeZones!.isNotEmpty
              ? countryToView.timeZones!.first
              : 'N/A',
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Start of the week',
          infoValue: countryToView.population.toString(),
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Driving side',
          infoValue: countryToView.drivingSide.capitalizeFirstLetter,
        ),
      ],
    );
  }
}

class _CountriesInfoSection3 extends StatelessWidget {
  const _CountriesInfoSection3({
    required this.countryToView,
  });

  final Country countryToView;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CountryInfoBuilder(
          infoKey: 'Independent',
          infoValue: countryToView.isIndependent != null
              ? countryToView.isIndependent!
                  ? 'Yes'
                  : 'No'
              : 'N/A',
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Area',
          infoValue: '${countryToView.area.toString()}km2',
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'United nations member',
          infoValue: countryToView.unitedNationsMember != null
              ? countryToView.unitedNationsMember!
                  ? 'Yes'
                  : 'No'
              : 'N/A',
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Coordinates',
          infoValue: countryToView.coordinates.join(','),
        ),
        CountriesSpacing.smallHeight(),
      ],
    );
  }
}

class _CountriesInfoSection2 extends StatelessWidget {
  const _CountriesInfoSection2({
    required this.countryToView,
  });

  final Country countryToView;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CountryInfoBuilder(
          infoKey: 'Capital',
          infoValue: countryToView.capital,
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Continent',
          infoValue: countryToView.continent,
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Population',
          infoValue: countryToView.population.toString(),
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Alt Spelling',
          infoValue: countryToView.altSpelling,
        ),
      ],
    );
  }
}

class _CountriesInfoSection1 extends StatelessWidget {
  const _CountriesInfoSection1({
    required this.countryToView,
  });

  final Country countryToView;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CountryInfoBuilder(
          infoKey: 'Official Name',
          infoValue: countryToView.officialName,
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Common Name',
          infoValue: countryToView.commonName,
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Region',
          infoValue: countryToView.region,
        ),
        CountriesSpacing.smallHeight(),
        _CountryInfoBuilder(
          infoKey: 'Sub-region',
          infoValue: countryToView.subRegion,
        ),
      ],
    );
  }
}

/// To improve readablity, each section of the country details
///  in the UI is broke down into sections in code to avoid a long build method.
class _CountryInfoBuilder extends StatelessWidget {
  const _CountryInfoBuilder({
    required this.infoKey,
    required this.infoValue,
  });

  final String infoKey;
  final String infoValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$infoKey:',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        CountriesSpacing.smallWidth(),
        Flexible(
          child: Text(
            infoValue,
            style: Theme.of(context).textTheme.bodyText2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
