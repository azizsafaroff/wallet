import 'package:exam_project/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key, this.callback}) : super(key: key);

  final callback;

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: MyApp.variables.kPrimaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _makeButton(0, AssetImage('assets/icons/home.png')),
          _makeButton(1, AssetImage('assets/icons/wallet.png')),
          _makeButton(2, AssetImage('assets/icons/chat.png')),
          _makeButton(3, AssetImage('assets/icons/user.png')),
        ],
      ),
    );
  }

  Widget _makeButton(index, icon) {
    Color _iconColor = MyApp.variables.kTextColor;

    if (index == MyApp.variables.currentScreenIndex) {
      _iconColor = MyApp.variables.kPrimaryLightColor;
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.callback(index);
        },
        child: Container(
          padding: EdgeInsets.all(18.0),
          color: Colors.transparent,
          child: ImageIcon(
            icon,
            color: _iconColor,
          ),
        ),
      ),
    );
  }
}
