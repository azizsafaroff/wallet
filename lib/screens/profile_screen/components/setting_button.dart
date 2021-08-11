import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';



class SettingButton extends StatelessWidget {
  SettingButton({
    Key? key, this.icon, this.title,
  }) : super(key: key);

  final AssetImage? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF3D3D3D),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: MyApp.variables.kPrimaryLightColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ImageIcon(icon),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              "$title",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
