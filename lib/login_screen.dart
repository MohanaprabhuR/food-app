import 'package:flutter/material.dart';
import 'colors.dart';
import 'constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  bgImage,
                  height: height * 0.40,
                  width: width,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: height * 0.40,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.2, 2.5],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.white],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: appName + "\n",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: slogan,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor.withOpacity(0.3), Colors.white],
                  ),
                  border: Border(
                    left: BorderSide(color: primaryColor, width: 5),
                  ),
                ),
                child: Text(
                  "  $logInString     ",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  prefixIcon: Icon(Icons.email, color: primaryColor),
                  labelText: "Email Addess",
                  labelStyle: TextStyle(color: primaryColor, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  prefixIcon: Icon(Icons.lock_open, color: primaryColor),
                  labelText: "Psssword",
                  labelStyle: TextStyle(color: primaryColor, fontSize: 12),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  forgetPassword,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: height * 0.05,
                width: width - 30,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  child: Text(logButtonText),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  noAccount,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    createAccount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
