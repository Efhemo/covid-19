import 'package:covid19/model/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../k.dart';

class PageItem extends StatelessWidget {
  const PageItem({this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(
                left: kDefaultPadding, bottom: kDefaultPadding - 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding - 5),
                  child: Text(message.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: kDefaultPadding,
                          color: Colors.white)),
                ),
                Text(message.subtitle,
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.4,
                        fontSize: kDefaultPadding - 5))
              ],
            ),
          ),
        ),
        Expanded(flex: 2, child: SvgPicture.asset(message.svgIconName))
      ],
    );
  }
}
