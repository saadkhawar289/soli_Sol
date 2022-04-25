import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:solis_sol/Profile.dart';
import 'package:solis_sol/Providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'Providers/profile_provider.dart';
import 'auth.dart';


import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';








void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ProfileProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      DevicePreview(
        enabled: false,
        builder: (context) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
            Locale('es'),
            Locale('el'),
            Locale('et'),
            Locale('nb'),
            Locale('nn'),
            Locale('pl'),
            Locale('pt'),
            Locale('ru'),
            Locale('hi'),
            Locale('ne'),
            Locale('uk'),
            Locale('hr'),
            Locale('tr'),
            Locale.fromSubtags(
                languageCode: 'zh',
                scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
            Locale.fromSubtags(
                languageCode: 'zh',
                scriptCode:
                'Hant'), // Generic traditional Chinese 'zh_Hant'
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          routes: {
            '/':(BuildContext context)=>const AuthPage(),
            '/profile':(BuildContext context)=>const Profile(),
          },

        ));

      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/':(BuildContext context)=>const AuthPage(),
          '/profile':(BuildContext context)=>const Profile(),
        },

      )


     ;
  }
}


