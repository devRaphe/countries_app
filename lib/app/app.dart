import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/countries/countries_view.dart';
import '../ui/countries_detail/countries_detail_view.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: CountriesView, initial: true),
    AdaptiveRoute(page: CountriesDetailView),
  ],
  dependencies: [
    LazySingleton<NavigationService>(classType: NavigationService),
    LazySingleton<BottomSheetService>(classType: BottomSheetService)
  ],
  logger: StackedLogger(),
)

/// This class only serves the purpose of using the [StackedApp] annotation
class AppSetup {}
