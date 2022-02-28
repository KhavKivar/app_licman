import 'dart:ui';

import 'package:app_licman/model/state/equipoState.dart';
import 'package:app_licman/ui/ui_creacion_acta/acta_general_page.dart';
import 'package:app_licman/ui/ui_acta/acta_inspeccion_page.dart';
import 'package:app_licman/ui/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'const/Colors.dart';
import 'model/state/actaState.dart';

import 'model/state/commonVarState.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    final appDirectory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
  }



  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EquipoState()),

        ChangeNotifierProvider(create: (context) => CommonState()),
        ChangeNotifierProvider(create: (context) => ActaState())
      ],
      child: MaterialApp(
         scrollBehavior: MyCustomScrollBehavior(),
        title: 'Licman App',
          debugShowCheckedModeBanner: false,
        theme:ThemeData(fontFamily: 'Poppins',
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor:yellowBackground
        ),
        home: Homepage()
      ),
    );
  }
}
