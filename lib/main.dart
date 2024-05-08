import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterprofile/SplashScreen.dart';
import 'package:flutterprofile/pages/AssociativePage.dart';
import 'package:flutterprofile/pages/CertificatPage.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:flutterprofile/pages/contact_page.dart';
import 'package:flutterprofile/pages/experience_page.dart';
import 'package:flutterprofile/pages/home_page.dart';
import 'package:flutterprofile/pages/portfolio_page.dart';
import 'package:flutterprofile/pages/team_page.dart';
import 'package:flutterprofile/pages/ImagesPage.dart'; // Importez la page ImagePage
import 'package:flutterprofile/services.dart';
import 'package:flutterprofile/utils/AppColors.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of
    <ThemeProvider>(context);

    return GetMaterialApp(
      translations: languageTranslate(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale("fr", "FR"),
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getTheme(),
      routes: {
        '/': (context) => SplashScreen(),
        '/HomePage': (context) => MyHomePage(),
        '/ExperiencePage':(context) =>ExperiencePage(),
        '/PortfolioPage':(context) =>PortfolioPage(),
            '/ProjetPage':(context) =>Projet(),
        '/VieAssociativePage':(context) =>VieAssociativePage(),
        '/ContactPage':(context) =>ContactPage(),

      },
    );
  }
}


final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedMenuIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 6, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedMenuIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: backgroundLight,
        body: Container(
          child: Row(
            children: <Widget>[
              Container(
                width: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 45,
                      height: 45,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/avtar1.png"),
                    ),

                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      HomePage(),
                      PortfolioPage(),
                      ExperiencePage(),
                      Projet(),
                      VieAssociativePage(),
                      ContactPage(),
                      CertificatPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor:Color(int.parse('574682', radix: 16)).withOpacity(1.0),
          color: Color(int.parse('574682', radix: 16)).withOpacity(1.0), // Couleur de fond personnalisée

      animationDuration: const Duration(milliseconds: 300),
          items: const <Widget>[
            Icon(Icons.home, size: 26, color: Colors.white),
            Icon(Icons.account_box, size: 26, color: Colors.white),
            Icon(Icons.timer_outlined, size: 26, color: Colors.white),
            Icon(Icons.outbox_rounded, size: 26, color: Colors.white),
            Icon(Icons.accessibility_sharp, size: 26, color: Colors.white),
            Icon(Icons.phone, size: 26, color: Colors.white),

          ],
          onTap: (index) {
            _tabController.animateTo(index);
          },
        ),

      ),
    );
  }
}