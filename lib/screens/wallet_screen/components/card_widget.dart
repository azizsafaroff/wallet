import 'package:flutter/material.dart';

import '../../../main.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: MyApp.variables.kPrimaryLightColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageIcon(
                AssetImage('assets/icons/chip.png'),
                color: MyApp.variables.kTextColor,
              ),
              Container(
                child: ImageIcon(
                  AssetImage('assets/icons/visa.png'),
                  color: MyApp.variables.kTextColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            "4562 1122 4595 7852",
            style: TextStyle(
              fontSize: 24.0,
              // fontWeight: FontWeight.,
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CARD HOLDER",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Ghulam",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Expiry Date",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "24/2020",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
