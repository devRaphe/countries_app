import 'package:stacked/stacked.dart';

class WebViewLoaderViewModel extends BaseViewModel {
  void onPageStarted(started) {
    setBusy(true);
  }

  void onPageFinished(finish) {
    setBusy(false);
  }
}
