import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note_app/core/db/db_helper.dart';
import 'package:flutter_note_app/ui/pages/home_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: "Flutter Note App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
