import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/screens/mainscreen.dart';
import 'package:myapp/screens/splashscreen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    User? firebaseUser = FirebaseAuth.instance.currentUser;
    Widget firstWidget;
    if (firebaseUser != null) {
          firstWidget = MainScreen();
    } else {
          firstWidget = SplashScreen();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IOT App",
      home: Scaffold(
        body: firstWidget,
      ),
      theme: ThemeData(
        primaryColor: const Color(0xff61dafb),
        backgroundColor: const Color(0xff292a2a),
      ),
    );
  }
}
