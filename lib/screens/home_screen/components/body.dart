import 'package:exam_project/main.dart';
import 'package:exam_project/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'line_chart_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentIndexButton = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                Text(
                  "Your Balance",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Money Received",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$27,802.05",
                      style: TextStyle(
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "15%",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Icon(CupertinoIcons.arrow_up, size: 18.0),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 250.0,
            child: LineReportChart(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 50.0),
                Container(
                  height: 60.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _makeDateButton(0, "Apr to Jun"),
                      SizedBox(width: 14.0),
                      _makeDateButton(1, "1 Month"),
                      SizedBox(width: 14.0),
                      _makeDateButton(2, "6 Month"),
                      SizedBox(width: 14.0),
                      _makeDateButton(3, "1 Year"),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "75%",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Icon(CupertinoIcons.arrow_down, size: 18.0),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 14.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Outcome",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "25%",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Icon(CupertinoIcons.arrow_up, size: 18.0),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _makeDateButton(index, text) {
    Color _buttonColor = Color(0xFF3D3D3D);
    Color _textColor = Colors.white.withOpacity(.5);
    FontWeight _textWeight = FontWeight.w300;

    if (_currentIndexButton == index) {
      _buttonColor = MyApp.variables.kPrimaryLightColor;
      _textColor = MyApp.variables.kTextColor;
      _textWeight = FontWeight.bold;
    }

    if (index == 0) {
      return Expanded(
        flex: 9,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _currentIndexButton = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: _buttonColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _textColor,
                fontWeight: _textWeight,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      );
    }

    return Expanded(
      flex: 4,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndexButton = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: _buttonColor,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text.split(' ')[0],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  color: _textColor,
                  fontWeight: _textWeight,
                ),
              ),
              Text(
                text.split(' ')[1],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  color: _textColor,
                  fontWeight: _textWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
