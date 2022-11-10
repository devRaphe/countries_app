import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'countries_detail_viewmodel.dart';

class CountriesDetailView extends StatelessWidget {
  const CountriesDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CountriesDetailViewModel>.reactive(
      viewModelBuilder: () => CountriesDetailViewModel(),
      builder: (
        BuildContext context,
        CountriesDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'CountriesDetailView',
            ),
          ),
        );
      },
    );
  }
}
