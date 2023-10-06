import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mvp_architecture/presenter/internet_presenter.dart';

class InternetScreen extends StatefulWidget {
  @override
  _InternetScreenState createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> implements InternetView {
  bool _isConnected = false;
  final InternetPresenter presenter = InternetPresenter();

  @override
  void initState() {
    super.initState();
    presenter.attachView(this);
    presenter.checkInternetConnectivity();
  }

  @override
  void dispose() {
    presenter.detachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Check (MVP)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Internet Connectivity Status:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              _isConnected ? 'You are Connected to Internet.' : 'No Internet Connection!',
              style: _isConnected
                  ? TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.green)
                  : TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.red),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void updateConnectivity(bool isConnected) {
    setState(() {
      _isConnected = isConnected;
    });
  }

  Widget loading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
