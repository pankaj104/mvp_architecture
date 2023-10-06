import 'package:mvp_architecture/model/internet_model.dart';

class InternetPresenter {
  final InternetModel model = InternetModel();
  InternetView? _view;

  void attachView(InternetView view) {
    _view = view;
  }

  void detachView() {
    _view = null;
  }

  void checkInternetConnectivity() {
    model.internetStream.listen(
          (isConnected) {
        if (_view != null) {
          _view!.updateConnectivity(isConnected);
        }
      },
    );
  }
}

abstract class InternetView {
  void updateConnectivity(bool isConnected);
}
