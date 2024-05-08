import 'package:flutter/material.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TeamPage {
  final String title;
  final String description;
  final IconData icon;
  final List<String> imagePaths;

  TeamPage({
    required this.title,
    required this.description,
    required this.icon,
    required this.imagePaths,
  });
}

class CardCustom extends StatelessWidget {
  final Widget child;
  final Color? color;

  CardCustom({required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: child,
    );
  }
}

class Projet extends StatefulWidget {
  @override
  State<Projet> createState() => _ProjetState();
}

class _ProjetState extends State<Projet> {
  int selectedProjectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "N1".tr,
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
              "langue".tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            items: [
              buildDropItem("English", "en"),
              buildDropItem("Francais", "fr"),
            ],
            onChanged: (value) {
              Get.updateLocale(Locale(value));
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          _buildProjectCard("projet1".tr, "descp1".tr, Icons.fitness_center, imagePaths: [
            "assets/flutter.png",
            "assets/firebase.png",
          ]),
          _buildProjectCard("projet2".tr, "descp2".tr, Icons.web, imagePaths: [
            "assets/angular.png",
            "assets/spring.png",
            "assets/mysql.png"
          ]),
          _buildProjectCard("projet3".tr, "descp3".tr, Icons.assignment, imagePaths: [
            "assets/laravel.png",
            "assets/vue js.png",
            "assets/mysql.png"
          ]),
          _buildProjectCard("projet4".tr, "descp4".tr, Icons.chat, imagePaths: [
            "assets/angular.png",
            "assets/spring.png",
            "assets/mysql.png", "assets/firebase.png",

          ]),
          _buildProjectCard("projet5".tr, "descp5".tr, Icons.monetization_on, imagePaths: [
            "assets/flutter.png",
            "assets/firebase.png",
          ]),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, IconData icon, {required List<String> imagePaths}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedProjectIndex = -1;
          });
        },
        child: CardCustom(
          color: Colors.grey[200],
          child: ListTile(
            leading: Icon(icon),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            onTap: () {
              _showDescription(context, description, imagePaths);
            },
          ),
        ),
      ),
    );
  }


  void _showDescription(BuildContext context, String description, List<String> imagePaths) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(description,style: TextStyle(fontSize: 16) ),
              SizedBox(height: 50),
              SizedBox(width: 50),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagePaths.map((path) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                        child: Image.asset(
                          path,
                          width: 60,
                          height: 80,
                        ),

                    );
                  }).toList(),
                ),
              ),

            ],
          ),
        );
      },
    );
  }


  DropdownMenuItem buildDropItem(String langue, String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        langue,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
