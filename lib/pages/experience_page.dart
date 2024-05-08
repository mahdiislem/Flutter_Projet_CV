import 'package:flutter/material.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:flutterprofile/utils/AppColors.dart';
import 'package:flutterprofile/utils/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Experiences',
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.briefcase),
                  color: Colors.indigo,
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                Text(
                  "Professional Experience",
                  style: headerTextStyle,
                ),
              ],
            ),

            SizedBox(height: 10),
            _itemWidget("Janvier 2022 - Présent", "Exp1".tr, "des1".tr, 'assets/ABC.png'),
            _itemWidget("Mai 2019 - Décembre 2022", "Exp2".tr, "des2".tr, 'assets/xyz.jpg'),
            _itemWidget("September 2016 - Avril 2018", "Exp3".tr, "des3".tr,'assets/acme.png'),
            _itemWidget("Juin 2014 - Juillet 2014", "Exp4".tr, "des4".tr,'assets/tech.png'),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(String title, String entreprise, String description, String logoPath) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 40, // Hauteur de l'image du logo
                width: 40, // Largeur de l'image du logo
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(logoPath), // Chemin de l'image du logo
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                title,
                style: subHeaderTextStyle,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 6, top: 10),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 2, color: Colors.grey),
              ),
            ),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: cardBGColor,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.building),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          entreprise,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(description,style: TextStyle(
    color: Colors.black,),),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],

      ),
    );
  }

  DropdownMenuItem buildDropItem(String language, String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        language,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
