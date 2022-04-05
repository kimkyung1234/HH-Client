import 'package:app/pages/login/login_page.dart';
import 'package:app/providers/add_post.dart';
import 'package:app/providers/edit_profile.dart';
import 'package:app/providers/login.dart';
import 'package:app/providers/page.dart';
import 'package:app/providers/theme.dart';
import 'package:app/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger()),
        ChangeNotifierProvider<EditProfile>(create: (_) => EditProfile()),
        ChangeNotifierProvider<UserName>(create: (_) => UserName()),
        ChangeNotifierProvider<AddPost>(create: (_) => AddPost()),
        ChangeNotifierProvider<LoginHelper>(create: (_) => LoginHelper()),
        ChangeNotifierProvider<Pages>(create: (_) => Pages()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        systemOverlayStyle: themeMode.getThemeDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      )),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
