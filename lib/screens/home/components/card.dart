import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../k.dart';

class BottomCard extends StatelessWidget {
  final Size size;

  const BottomCard(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      height: 250,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 140.0,
            decoration: BoxDecoration(
                color: kAppYellow, borderRadius: BorderRadius.circular(8.0)),
          ),
          Positioned(
            top: 1,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/images/doctor_virus.svg',
                  width: 100),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Need to test Covid-19',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: kDefaultPadding),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: size.width - 200,
                      child: Text(
                          'There are laboratory tests that can  identify the virus that causes COVID-19 in respiratory specimens.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: kDefaultPadding - 7)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
