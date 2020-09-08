import 'package:covid19/model/message.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../k.dart';
import 'components/card.dart';
import 'components/header_page_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size size;
  PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 1.5);
  var _currentIndexPage = 0;

  var messages = [
    Message(
        title: 'Symptoms',
        subtitle:
            'People may be sick with the virus for 1 to 14 days before developing symptoms',
        svgIconName: 'assets/images/person_covid.svg'),
    Message(
        title: 'Treatment',
        subtitle:
            'People may be sick with the virus for 1 to 14 days before developing symptoms',
        svgIconName: 'assets/images/person_covid.svg'),
    Message(
        title: 'Clean & disinfect',
        subtitle:
            'People may be sick with the virus for 1 to 14 days before developing symptoms',
        svgIconName: 'assets/images/person_covid.svg'),
  ];

  var preventions = [
    Message(title: 'Stay at home', svgIconName: 'assets/images/stay_home.svg'),
    Message(
        title: 'Keep a safe distance',
        svgIconName: 'assets/images/keep_distance.svg'),
    Message(
        title: 'Wash hands often',
        svgIconName: 'assets/images/watch_hands.svg'),
    Message(
        title: 'Cover coughs and sneezes',
        svgIconName: 'assets/images/stay_home.svg'),
    Message(
        title: 'Wear face mask if you are sick',
        svgIconName: 'assets/images/wear_mask.svg'),
    Message(
        title: 'Clean and disinfect', svgIconName: 'assets/images/clean.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.27,
            width: size.width,
            decoration: homeBoxDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndexPage = index;
                        });
                      },
                      itemCount: messages.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          PageItem(message: messages[index])),
                ),
                SizedBox(height: kDefaultPadding / 1.5),
                Container(
                  margin: EdgeInsets.only(
                      left: kDefaultPadding - 2, right: kDefaultPadding - 10),
                  child: DotsIndicator(
                      dotsCount: messages.length,
                      decorator: kDotsDecoration,
                      position: _currentIndexPage.toDouble()),
                ),
                SizedBox(height: kDefaultPadding + 10)
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: kDefaultPadding + 10,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                child: Text(
                  'Prevention',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontWeight: FontWeight.bold,
                      fontSize: kDefaultPadding),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding,
                      bottom: kDefaultPadding,
                      top: kDefaultPadding + kDefaultPadding,
                      right: kDefaultPadding),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildPreventionItem(preventions[0], context),
                          buildPreventionItem(preventions[1], context),
                          buildPreventionItem(preventions[2], context),
                        ],
                      ),
                      SizedBox(height: kDefaultPadding + 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildPreventionItem(preventions[3], context),
                          buildPreventionItem(preventions[4], context),
                          buildPreventionItem(preventions[5], context),
                        ],
                      ),

                      SizedBox(
                        height: kDefaultPadding,
                        width: double.infinity,
                      ),
                      BottomCard(size)
                      //virus doctor
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  buildPreventionItem(Message message, BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(message.svgIconName, width: 70.0, height: 70.0),
          SizedBox(height: 5.0),
          Text(
            message.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
