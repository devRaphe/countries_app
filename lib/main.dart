import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'core/theme/countries_theme_manager.dart';
import 'services/theme_service/theme_service.dart';

void main() async {
  await setupLocator();
  runApp(const CountriesApp());
}

/// This is the main root or top most widget.
class CountriesApp extends StatelessWidget {
  ///
  const CountriesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: CountryAppViewModel.new,
      builder: (context, model, child) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: model.themeMode,
            darkTheme: CountriesThemeManager.darkTheme,
            theme: CountriesThemeManager.lightTheme,
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
          );
        },
      ),
    );
  }
}

/// Viewmodel for the [CountriesApp] widget.
/// The viewmmodel only set dynamic data to the view, such as [ThemeMode]
class CountryAppViewModel extends ReactiveViewModel {
  final _themeService = locator<ThemeService>();

  /// This getter returns the current theme mode.
  ThemeMode get themeMode => _themeService.themeMode;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];
}
