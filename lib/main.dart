import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memeyogi/ui/screens/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:memeyogi/core/app_colors.dart';
import 'package:memeyogi/data/provider/auth_provider.dart';
import 'package:memeyogi/root.dart';
import 'package:memeyogi/ui/auth/login_page.dart';
import 'package:memeyogi/ui/screens/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await runZonedGuarded<Future<void>>(
    () async {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider(FirebaseAuth.instance),
            ),
            StreamProvider<User?>(
              create: (context) =>
                  context.read<AuthProvider>().authStateChanges,
              initialData: null,
            ),
          ],
          child: MyApp(),
        ),
      );
    },
    _onError,
  );
}

Future<void> _onError(dynamic error, dynamic stackTrace) async {
  //TODO: can be used to send data for log sentry or crashlytics
  debugPrint('[Caught error] $error');
  // debugPrint('[STACKTRACE] $stackTrace');
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// ignore: prefer_mixin
class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        await offlineStatus('inactive');
        break;
      case AppLifecycleState.paused:
        await offlineStatus('paused');
        break;
      case AppLifecycleState.detached:
        await offlineStatus('detached');
        break;
      case AppLifecycleState.resumed:
        onlineStatus();
        break;
    }
  }

  Future<void> offlineStatus(String status) async {
    print('[Device Status]: $status');
  }

  void onlineStatus() {
    print('[Device Status]: Active');
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
      systemNavigationBarColor: kPrimaryColor,
    ));
    return MaterialApp(
      title: 'Meme Yogi',
      //  TODO: create a sep class of theme to easily switch bw light and dark
      // theme: Theme.of(context).copyWith(
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: kPrimaryColor,
      //   ),
      //   scaffoldBackgroundColor: kPrimaryColor,
      // ),
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}
