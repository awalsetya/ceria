import 'package:ceria/shared/icons.dart';
import 'package:ceria/shared/theme.dart';
import 'package:ceria/ui/pages/app.dart';
import 'package:ceria/ui/pages/login.dart';
import 'package:ceria/ui/widget/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 90,
                width: 100,
                child: Image.asset("assets/img/CERIA.jpg"),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Clean Home\nClean Life.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Book Cleaners at the Comfort\nof you home.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 250,
                child: SvgPicture.asset(
                  iconLogo,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (contex) => LoginPage()),
                  );
                },
                child: CustomButton(
                  "Get Started",
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
