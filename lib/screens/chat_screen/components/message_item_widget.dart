import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class MessageItemWidget extends StatelessWidget {
  MessageItemWidget(
      {Key? key, this.image, this.title, this.subtitle, this.date})
      : super(key: key);

  final ImageProvider? image;
  final String? title;
  final String? subtitle;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Color(0xFF3D3D3D),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            child: CircleAvatar(
              backgroundImage: image!,
            ),
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
            "$date",
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
