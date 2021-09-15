import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      getPages: Nav.routes,
      theme: ThemeData.light().copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
      darkTheme: ThemeData.dark().copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
    );
  }
}
