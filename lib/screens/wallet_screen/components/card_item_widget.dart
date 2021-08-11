import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';



class CardItemWidget extends StatelessWidget {
  CardItemWidget({
    Key? key, this.icon, this.title, this.subtitle, this.price
  }) : super(key: key);

  final AssetImage? icon;
  final String? title;
  final String? subtitle;
  final String? price;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  "$subtitle",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.0),
          Text(
            "$price",
            style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
