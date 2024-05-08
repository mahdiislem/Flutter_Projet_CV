import 'package:flutter/material.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class CertificatPage extends StatelessWidget {
  const CertificatPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Certificat".tr,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(int.parse('574682', radix: 16)).withOpacity(1.0),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6_sharp, color: Colors.white60,),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50.0),
            _buildTitle("Certificats", FontAwesomeIcons.certificate),
            const SizedBox(height: 10.0),
            _buildCertificatesListWithImages([
              {
                "Certificate": "Certif".tr,
                "Institution": "Institution".tr,
                "Date": "12-09-2015",
                "ImagePath":  "assets/azure.png"
              },
              {
                "Certificate":  "Certif1".tr,
                "Institution": "Institution1".tr,
                "Date": "10-04-2016",
                "ImagePath":  "assets/istqb.png"
              },
              {
                "Certificate": "Certif2".tr,
                "Institution": "Institution2".tr,
                "Date": "02-02-2018",
                "ImagePath":  "assets/ccna.png"
              },
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificatesListWithImages(List<Map<String, String>> certificates) {
    return Column(
      children: certificates.map((certificate) {
        return ListTile(
          leading: Image.asset(certificate['ImagePath']!),
          title: Text(certificate['Certificate']!),
          subtitle: Text('${certificate['Institution']}    '
              '( ${certificate['Date']})'),

          trailing: Icon(
            Icons.check_circle,
            color: Colors.lightGreen, // Couleur de l'icône de validation
          ),
        );
      }).toList(),
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

  Widget _buildTitle(String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                iconData,
                size: 20.0,
                color: Colors.grey [600],
              ),
              const SizedBox(width: 15.0),
              Text(
                title.toUpperCase(),
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
