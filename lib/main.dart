import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/notifier/ads_notifier.dart';
import 'package:flutter_task/screens/home_screen.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//void main() => runApp(MultiProvider(
//      providers: [
//        ChangeNotifierProvider(
//          create: (context) => AdsNotifier(),
//        ),
//      ],
//      child: const MyApp(),
//    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

