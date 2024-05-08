import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterprofile/pages/PDFView.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:flutterprofile/pages/map_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact',
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
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),

            Row(
              children: [
                Expanded(
                  child: Text(
                    "contact".tr,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Lottie.asset(
                  'assets/Contact.json',
                  width: 70,
                  height: 60,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(height: 10),
            _itemWidgetmail("Email", "demo@gmail.com"),
            _itemWidget("Mobile", "25489654"),
            _itemWidgetPDF("PDF", "Source PDF"),
            _itemWidgetAdrees("Adress", "Tunisia, Sfax Sud Route El Ain"),

            SizedBox(height: 20),
            Lottie.asset(
              'assets/adress.json',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapScreen()),
          );
        },
        label: Text("Afficher la carte"),
        icon: Icon(Icons.map),
      ),
    );
  }

  Widget _itemWidgetmail(title, value) {
    return GestureDetector(
      onTap: () {
        // Action when tapped
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(
            children: [
              IconButton(
                color: Colors.indigo,
                icon: const Icon(Icons.email_rounded),
                onPressed: () {},
              ),
              SizedBox(width: 10.0),
              Text(value, style: TextStyle(fontSize: 16.0)),
              SizedBox(width: 10.0),
              SvgPicture.asset(
                'assets/pdf_icon.svg',
                width: 20,
                height: 20,
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _itemWidget(title, value) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(
            children: [
              IconButton(
                color: Colors.indigo,
                icon: const Icon(FontAwesomeIcons.phone),
                onPressed: () {},
              ),
              SizedBox(width: 10.0),
              Text(value, style: TextStyle(fontSize: 16.0)),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _itemWidgetPDF(title, value) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFViewerPage(path: 'chemin_vers_le_pdf'),
          ),
        );      },
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 2),
            Row(
              children: [
                IconButton(
                  color: Colors.indigo,
                  icon: const Icon(Icons.picture_as_pdf),
                  onPressed: () {},
                ),
                SizedBox(width: 10.0),
                Text(value, style: TextStyle(fontSize: 16.0)),
                SizedBox(width: 10.0),
                SvgPicture.asset(
                  'assets/pdf_icon.svg',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
  Widget _itemWidgetAdrees(title, value) {
    return GestureDetector(
      onTap: () {
        // Action when tapped
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(
            children: [
              IconButton(
                color: Colors.indigo,
                icon: const Icon(Icons.map),
                onPressed: () {},
              ),
              SizedBox(width: 10.0),
              Text(value, style: TextStyle(fontSize: 16.0)),
              SizedBox(width: 10.0),
              SvgPicture.asset(
                'assets/pdf_icon.svg',
                width: 20,
                height: 20,
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
