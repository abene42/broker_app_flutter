import 'package:broker_app/pages/add_detail_page/add_detail_page.dart';
import 'package:broker_app/pages/add_photos_page/add_photos_page.dart';
import 'package:broker_app/pages/detail_page/detail_page.dart';
import 'package:broker_app/pages/homepage/homepage.dart';
import 'package:broker_app/pages/rent_or_purchase_page/rent_or_purchase_page.dart';
import 'package:broker_app/pages/search_page/search_page.dart';
import 'package:broker_app/pages/search_result/search_result.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Broker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryIconTheme: const IconThemeData(
          color: Color(0xff3E4E5E),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xff3E4E5E),
          secondary: Color(0xff0884FF),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Color(0xff3E4E5E),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xff3E4E5E),
          ),
        ),
      ),
      home: Homepage(),
      getPages: [
        GetPage(name: '/homepage', page: () => Homepage()),
        GetPage(name: '/rentOrPurchase', page: () => RentOrPurchasePage()),
        GetPage(name: '/searchPage', page: () => SearchPage()),
        GetPage(name: '/searchResult', page: () => SearchResult()),
        GetPage(name: '/detailPage', page: () => DetailPage()),
        GetPage(name: '/addDetail', page: () => AddDetailPage()),
        GetPage(name: '/addPhotos', page: () => AddPhotosPage()),
      ],
    );
  }
}
