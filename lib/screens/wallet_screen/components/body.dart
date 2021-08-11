import 'package:exam_project/main.dart';
import 'package:exam_project/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_item_widget.dart';
import 'card_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          Text(
            "Your Cards",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "You have 3 Active Cards",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(height: 20.0),
          CardWidget(),
          SizedBox(height: 16.0),
          Text(
            "Recent Transactions",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          CardItemWidget(
            title: "Salary",
            subtitle: "Belong Interactive",
            icon: AssetImage('assets/icons/salary.png'),
            price: "+\$2,010",
          ),
          SizedBox(height: 20.0),
          CardItemWidget(
            title: "Paypal",
            subtitle: "Webtech",
            icon: AssetImage('assets/icons/paypal.png'),
            price: "+\$12,010",
          ),
          SizedBox(height: 20.0),
          CardItemWidget(
            title: "Paypal",
            subtitle: "Webtech",
            icon: AssetImage('assets/icons/car.png'),
            price: "+\$232,010",
          ),
        ],
      ),
    );
  }
}