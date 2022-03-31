import 'package:app/providers/image.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/providers/login.dart';
import 'package:app/providers/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GalleryImage>(create: (_) => GalleryImage()),
        ChangeNotifierProvider<LoginHelper>(create: (_) => LoginHelper()),
        ChangeNotifierProvider<Pages>(create: (_) => Pages()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        )),
        debugShowCheckedModeBanner: false,
        // home: LoginPage(),
        home: HomePage(),
      ),
    );
  }
}
