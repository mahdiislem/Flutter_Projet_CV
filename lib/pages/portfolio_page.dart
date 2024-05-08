import 'package:flutter/material.dart';
import 'package:flutterprofile/pages/CertificatPage.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PortfolioPage extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Me".tr,
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
        controller: _controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20.0),
            _buildHeader(),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(int.parse('d5b2e5', radix: 16)).withOpacity(1.0),
              ),
              child:  Text(
                "description2".tr,
                style: TextStyle(
                  color: Colors.black87,),
              ),
            ),
            _buildTitle("Skills".tr, FontAwesomeIcons.laptopCode),
            const SizedBox(height: 10.0),
            _buildSkillRow("Vue js", 0.75),
            const SizedBox(height: 5.0),
            _buildSkillRow("Laravel", 0.5),
            const SizedBox(height: 5.0),
            _buildSkillRow("Angular", 0.65),
            const SizedBox(height: 5.0),
            _buildSkillRow("Flutter", 0.7),
            const SizedBox(height: 30.0),

            const SizedBox(height: 20.0),
            _buildTitle("Education", FontAwesomeIcons.graduationCap),
            const SizedBox(height: 5.0),
            _buildExperienceRow(
              company: "Educ1".tr,
              position: "descrip1".tr,
              duration: "2008-2011",
              logoPath: "assets/magdich.jpg", // Chemin d'accès à l'image du logo
            ),
            _buildExperienceRow(
              company: "Educ2".tr,
              position: "descrip2".tr,
              duration: "2012 - 2014",
              logoPath: "assets/iit.jpg", // Chemin d'accès à l'image du logo
            ),
            _buildExperienceRow(
              company: "Educ3".tr,
              position: "descrip3".tr,
              duration: "2014-1016",
              logoPath: "assets/enetcom.jpg", // Chemin d'accès à l'image du logo
            ),

            const SizedBox(height: 20.0),
            _buildTitle("Langue".tr, FontAwesomeIcons.language),
            const SizedBox(height: 10.0),
            _buildSkillRow("Anglais", 0.6),
            const SizedBox(height: 5.0),
            _buildSkillRow("Français", 0.80),
            const SizedBox(height: 5.0),
            _buildSkillRow("Arabe", 0.9),
            const SizedBox(height: 100.0),



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CertificatPage()),
          );

          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
        label: Text("Certificat"),
        icon: Icon(Icons.padding_sharp),
      ),

    );
  }



  ListTile _buildExperienceRow({
    required String company,
    String? position,
    String? duration,
    String? logoPath, // Chemin d'accès à l'image du logo
  }) {
    return ListTile(
      leading: logoPath != null
          ? CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(logoPath),
      )
          : null,
      title: Text(
        company,
        style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 16.0),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            )),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        const SizedBox(width: 16.0),
      ],
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

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 30.0),
        SizedBox(height: 20.0),
        SizedBox(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/profil.png"),
            )),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "name".tr,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text("metier".tr),
            const SizedBox(height: 5.0),
            Row(
              children: const <Widget>[
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
        )
      ],
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
