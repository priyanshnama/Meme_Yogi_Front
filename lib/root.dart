import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memeyogi/ui/auth/login_page.dart';
import 'package:provider/provider.dart';
import 'package:memeyogi/data/provider/auth_provider.dart';
import 'package:memeyogi/ui/screens/home/home_page.dart';
import 'package:memeyogi/ui/screens/splash_screen.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  StreamController<AuthProvider> _streamController = StreamController();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        final provider = Provider.of<AuthProvider>(context);

        if (provider.isSigningIn) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
        return Container();
      },
    );
  }
}
