import 'package:connectivity_plus/connectivity_plus.dart';

class InternetModel {
  final Connectivity _connectivity = Connectivity();

  Stream<bool> get internetStream => _connectivity.onConnectivityChanged.map(
        (result) => result != ConnectivityResult.none,
  );
}
