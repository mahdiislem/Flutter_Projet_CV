import 'package:flutter/material.dart';
import 'package:flutterprofile/pages/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CV App',
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.0),
              Lottie.asset(
                'assets/hello.json',
                width: double.infinity,
                height: 100,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 50.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/HomePage');
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black45,
                          width: 1.0,
                        ),
                      ),
                      child: ClipOval(
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/profil.png"),
                          radius: 85,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Domodar Lohani",

                            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Lottie.asset(
                'assets/welcome.json',
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
}
