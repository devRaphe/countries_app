import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../shared/dumb_widgets/spacing.dart';
import 'filter_countries_bottom_sheet_viewmodel.dart';
import '../../core/extensions/widget_extension.dart';

/// This is the view for the FilterCountryBottomSheetView view.
class FilterCountriesBottomSheetView extends StatelessWidget {
  /// Constructor for the [FilterCountriesBottomSheetView] widget.
  const FilterCountriesBottomSheetView({
    super.key,
    required this.request,
    required this.completer,
  });

  /// The [SheetRequest] or data that is passed to the bottom sheet.
  final SheetRequest<dynamic> request;

  /// This serves as a completer function to tell the [BottomSheetService]
  /// to close the bottom sheet.
  /// SheetResponse allows you to pass data back to the previous view.
  final void Function(SheetResponse<List<String>>) completer;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterCountriesBottomSheetViewModel>.reactive(
      viewModelBuilder: FilterCountriesBottomSheetViewModel.new,
      builder: (
        BuildContext context,
        FilterCountriesBottomSheetViewModel model,
        Widget? child,
      ) {
        return DraggableScrollableSheet(
          initialChildSize: 0.3,
          maxChildSize: 0.8,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return ColoredBox(
              color: Theme.of(context).colorScheme.background,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        tilePadding: EdgeInsets.zero,
                        title: Text(
                          'Region',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        children: [
                          ...model.regions.map(
                            (region) => CheckboxListTile(
                              title: Text(
                                region,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              value: false,
                              onChanged: (state) {},
                            ),
                          )
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 48,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'RESET',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ).touchable(() {
                                completer(
                                  SheetResponse(
                                    confirmed: true,
                                  ),
                                );
                              }),
                            ),
                          ),
                          CountriesSpacing.largeWidth(),
                          Expanded(
                            flex: 10,
                            child: SizedBox(
                              height: 48,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                child: Center(
                                  child: Text(
                                    'Show results',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ).touchable(() {
                                completer(
                                  SheetResponse(
                                    confirmed: true,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CountriesSpacing.largeHeight(),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CheckboxState {
  bool value;
  String title;

  CheckboxState({
    required this.value,
    required this.title,
  });
}
