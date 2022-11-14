import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../core/extensions/widget_extension.dart';
import '../../models/country.dart';
import '../shared/dumb_widgets/spacing.dart';
import '../shared/dumb_widgets/statusbar.dart';
import 'countries_viewmodel.dart';

/// This is the first view of the app.
class CountriesView extends HookWidget {
  /// Constructor for the [CountriesView] widget.
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchTextEditingController = useTextEditingController();
    final textFocusNode = useFocusNode();
    return ViewModelBuilder<CountriesViewModel>.reactive(
      viewModelBuilder: CountriesViewModel.new,
      onModelReady: (model) => model.fetchCountries(),
      builder: (
        BuildContext context,
        CountriesViewModel model,
        Widget? child,
      ) {
        return Statusbar(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Explore.',
                style: GoogleFonts.elsieSwashCaps(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.surface,
                  height: 1.5,
                ),
              ),
              centerTitle: false,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    child: Theme.of(context).brightness == Brightness.dark
                        ? IconButton(
                            onPressed: model.turnOnLightMode,
                            icon: Icon(
                              Icons.dark_mode_sharp,
                              color: Theme.of(context).colorScheme.surface,
                              size: 30.w,
                            ),
                          )
                        : IconButton(
                            onPressed: model.turnOnDarkMode,
                            color: Theme.of(context).colorScheme.surface,
                            icon: Icon(Icons.light_mode, size: 30.w),
                          ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  CountriesSpacing.mediumHeight(),
                  _SearchTextField(
                    searchTextEditingController: searchTextEditingController,
                    focusNode: textFocusNode,
                  ),
                  CountriesSpacing.mediumHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _FilterBox(
                        label: 'EN',
                        icon: CupertinoIcons.globe,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                      ).defaultBorderRadius.touchable(() {}),
                      _FilterBox(
                        label: 'Filter',
                        icon: Icons.filter_alt_outlined,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                      ).defaultBorderRadius.touchable(model.filterCountries),
                    ],
                  ),
                  CountriesSpacing.mediumHeight(),
                  Expanded(
                    child: _CountriesBuilder(
                      key: UniqueKey(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CountriesBuilder extends ViewModelWidget<CountriesViewModel> {
  const _CountriesBuilder({super.key});

  @override
  Widget build(BuildContext context, CountriesViewModel model) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: model.countries.length,
      itemBuilder: (context, index) {
        final country = model.countries[index];
        return _CountryTile(
          key: UniqueKey(),
          country: country,
        ).defaultBorderRadius.touchable(() {
          model.navigateToCountryDetailsView(country);
        });
      },
    );
  }
}

class _CountryTile extends StatelessWidget {
  const _CountryTile({super.key, required this.country});
  final Country country;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        height: 40.w,
        width: 40.w,
        child: ColoredBox(
          color: Theme.of(context).colorScheme.secondary,
          child: CachedNetworkImage(
            imageUrl: country.flagImageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ).defaultBorderRadius,
      title: Text(country.officialName),
      subtitle: Text(country.capital),
    );
  }
}

class _FilterBox extends StatelessWidget {
  const _FilterBox({
    required this.icon,
    required this.label,
    required this.padding,
  });
  final IconData icon;
  final String label;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon),
              CountriesSpacing.smallWidth(),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Textinput widget.
class _SearchTextField extends ViewModelWidget<CountriesViewModel> {
  const _SearchTextField({
    required this.searchTextEditingController,
    required this.focusNode,
  });

  final TextEditingController searchTextEditingController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, CountriesViewModel model) {
    return TextField(
      focusNode: focusNode,
      controller: searchTextEditingController,
      onChanged: (query) {
        model.searchCountries(query);
      },
      onEditingComplete: focusNode.unfocus,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIconColor: Theme.of(context).colorScheme.surface,
        focusColor: Theme.of(context).colorScheme.surface,
        hintText: 'Search. eg.name,capital,region',
        prefixIcon: const Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
