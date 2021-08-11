import 'package:exam_project/database/database_helper.dart';
import 'package:exam_project/main.dart';
import 'package:exam_project/screens/chat_screen/chat_screen.dart';
import 'package:exam_project/screens/home_screen/home_screen.dart';
import 'package:exam_project/screens/profile_screen/profile_screen.dart';
import 'package:exam_project/screens/wallet_screen/wallet_screen.dart';
import 'package:exam_project/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _currentScreenIndex = MyApp.variables.currentScreenIndex;

  List<Widget> _screens = [
    HomeScreen(),
    WalletScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();

    MyApp.variables.database = DatabaseHelper();
  }

  void callback(index) {
    setState(() {
      MyApp.variables.currentScreenIndex = index;
      _currentScreenIndex = MyApp.variables.currentScreenIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      // For theme settings
      data: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: MyApp.variables.kTextColor,
          ),
          actionsIconTheme: IconThemeData(
            color: MyApp.variables.kTextColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: MyApp.variables.kTextColor,
        ),
        scaffoldBackgroundColor: MyApp.variables.kPrimaryColor,
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyText1: TextStyle(color: MyApp.variables.kTextColor),
            bodyText2: TextStyle(color: MyApp.variables.kTextColor),
          ),
        ),
      ),
      child: Scaffold(
        body: _screens[_currentScreenIndex],
        bottomNavigationBar: CustomBottomBar(callback: callback),
      ),
    );
  }
}
