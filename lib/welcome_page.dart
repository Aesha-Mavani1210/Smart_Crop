import 'dart:async';
import 'package:flutter/material.dart';
import 'Home_page.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          minimum: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset('lib/images/I3.jpg'),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Welcome To Smart Crop",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 42),
                  child: Text(
                      "Get your agriculture products",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
