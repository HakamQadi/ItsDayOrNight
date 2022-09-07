import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ThemeData? theme = ThemeData.dark();

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color.fromARGB(255, 31, 31, 31),
  ));

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String period = "";
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) {
      period = "صبح";
      icon = Icons.brightness_low;
      clr = Color.fromARGB(255, 250, 236, 112);
      return period;
    }
    if (hour >= 12 && hour < 16) {
      period = 'ظهر';
      icon = Icons.wb_sunny_outlined;
      clr = Colors.yellow;
      return period;
    }
    if (hour >= 16 && hour <= 18) {
      period = 'عصر';
      icon = Icons.brightness_medium_rounded;
      clr = Colors.amber;
      return period;
    }
    period = 'ليل';
    icon = Icons.bedtime_outlined;
    clr = Colors.grey;
    return period;
  }

  void initState() {
    super.initState();
    if (greeting() == "صبح") {
      color = Colors.white;
      barColor = Colors.blue;
    }
    if (greeting() == "ظهر") {
      color = Colors.white;
      barColor = Colors.blue;
    }
    if (greeting() == "عصر") {
      color = Colors.white;
      barColor = Colors.blue;
    }
    if (greeting() == "ليل") {
      color = Color.fromARGB(255, 31, 31, 31);
      barColor = Color.fromARGB(255, 17, 17, 17);
      txtColor = Colors.white;
    }
  }

  void dispose() {
    super.dispose();
  }

  IconData? icon = null;
  Color clr = Colors.black;
  Color? color = null;
  Color? barColor = null;
  Color txtColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: barColor,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                greeting(),
                style: GoogleFonts.lemonada(color: txtColor, fontSize: 50),
              ),
              Container(
                child: Icon(
                  icon,
                  color: clr,
                  size: 100,
                ),
              ),
              // Container(
              //   child: Image(image: AssetImage("images/AppIcon.png"),),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
