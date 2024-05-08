import 'package:flutter/material.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CardTop extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final double iconSize;
  final TextStyle textStyle;

  CardTop({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconSize = 48.0,
    required this.textStyle,
  });

  @override
  _CardTopState createState() => _CardTopState();
}

class _CardTopState extends State<CardTop> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
        widget.onTap();
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: Color(int.parse('d5b2e5', radix: 16)).withOpacity(1.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300), // Durée de l'animation en millisecondes
          curve: Curves.easeInOut, // Courbe d'animation
          width: _isTapped ? 220 : 200, // Largeur personnalisée
          height: _isTapped ? 120 : 100, // Hauteur personnalisée
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: widget.iconSize, // Taille de l'icône
                color: Colors.grey[900],
              ),
              SizedBox(height: 8), // Espace entre l'icône et le titre
              Text(
                widget.title,
                style: widget.textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dans le code où vous utilisez GridView.builder

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> pages = [
    {'title': 'Accueil', 'icon': Icons.home, 'route': '/HomePage'},
    {'title': 'Profil', 'icon': Icons.account_box, 'route': '/PortfolioPage'},
    {'title': 'Expérience', 'icon': Icons.timer_outlined, 'route': '/ExperiencePage'},
    {'title': 'Projets', 'icon': Icons.outbox_rounded, 'route': '/ProjetPage'},
    {'title': 'Vie Associative', 'icon': Icons.accessibility_sharp, 'route': '/VieAssociativePage'},
    {'title': 'Contact', 'icon': Icons.contact_page_outlined, 'route': '/ContactPage'},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(int.parse('574682', radix: 16)).withOpacity(1.0),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6_sharp,color: Colors.white60,),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          DropdownButton(
            hint: Text(
              "Langue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            items: [
              buildDropItem("English", "en"),
              buildDropItem("Français", "fr"),
            ],
            onChanged: (value) {
              Get.updateLocale(Locale(value));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              SizedBox(width: 20.0),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profil.png"),
                      radius: 40,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "name".tr,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text("metier".tr),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.map,
                            size: 12.0,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Tunisia, Sfax",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: pages.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return CardTop(
                    icon: pages[index]['icon'],
                    title: pages[index]['title'],
                    onTap: () {
                      Navigator.pushNamed(context, pages[index]['route']);
                    },
                    iconSize: 40,
                    textStyle: TextStyle(fontSize: 14, color: Colors.black87), // Couleur du texte
                  );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem buildDropItem(String language, String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        language,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
