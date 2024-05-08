
import 'package:flutter/material.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class VieAssociativePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vie ".tr,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleLogoWithText(
                  logoPath: 'assets/jci.png',
                  title: "T1".tr,
                  duree:"duree".tr,
                  text: "text1".tr,
                  occupation: "occupation".tr,

                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: CircleLogoWithText(
                  logoPath: 'assets/hilal.jpg',
                  title: "T2".tr,
                  duree:"duree2".tr,
                  text: "text2".tr,
                  occupation: "occupation2".tr,

                ),
              ),
              SizedBox(height: 10.0),
              Lottie.asset(
                'assets/Contrat.json',
                width: double.infinity,
                height: 300,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
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


class CircleLogoWithText extends StatelessWidget {
  final String logoPath;
  final String duree;

  final String title;
  final String text;
  final String occupation;

  CircleLogoWithText({required this.logoPath, required this.title,required this.duree, required this.text, required this.occupation,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black45,
              width: 2.0,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(logoPath),
            radius: 50,
            backgroundColor: Colors.grey[200],
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 3.0),
        Text(
          duree,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 5.0),

        Text(
          text,
          style: TextStyle(
            fontSize: 15,

          ),
        ),
        SizedBox(height: 5.0),
        Text(
          occupation,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

}
