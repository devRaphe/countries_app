import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'countries_viewmodel.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CountriesViewModel>.reactive(
      viewModelBuilder: () => CountriesViewModel(),
      builder: (
        BuildContext context,
        CountriesViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'CountriesView',
            ),
          ),
        );
      },
    );
  }
}
