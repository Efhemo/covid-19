import 'dart:ui';

import 'package:covid19/k.dart';
import 'package:covid19/model/message.dart';
import 'package:covid19/model/statistic.dart';
import 'package:covid19/screens/statistic/search_box.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final messages = [
    Message(title: 'Confirmed', subtitle: '1092'),
    Message(title: 'Recovered', subtitle: '1092'),
    Message(title: 'Active', subtitle: '1092'),
    Message(title: 'Death', subtitle: '1092'),
  ];

  final statistics = [
    Statistic(
        country: 'Nigeria',
        active: '1024',
        confirmed: '23908',
        death: '120',
        recovered: '345'),
    Statistic(
        country: 'Ghana',
        active: '1024',
        confirmed: '23908',
        death: '120',
        recovered: '345'),
    Statistic(
        country: 'Canada',
        active: '1024',
        confirmed: '23908',
        death: '120',
        recovered: '345'),
    Statistic(
        country: 'Italy',
        active: '1024',
        confirmed: '23908',
        death: '120',
        recovered: '345'),
    Statistic(
        country: 'Republic of benue',
        active: '1024',
        confirmed: '23908',
        death: '120',
        recovered: '345')
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildRowStatCard1(),
          SizedBox(height: kDefaultPadding),
          buildRowStatCard2(),
          SearchBox(),
          StatItem(Statistic(
              country: 'Country',
              confirmed: 'Confirmed',
              death: 'Death',
              recovered: 'Recovered')),
          Column(
            children: statistics.map((statistic) {
              return StatItem(statistic, iconData: Icons.play_arrow);
            }).toList(),
          )
        ],
      ),
    );
  }

  /*Container(
            child: ListView.builder(
                primary: false,
                itemCount: statistics.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return StatItem(
                    statistics[index],
                    iconData: Icons.play_arrow,
                  );
                }) ,
          )*/

  Container buildRowStatCard2() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          buildStatCard(messages[2], Colors.green),
          SizedBox(width: kDefaultPadding),
          buildStatCard(messages[3], Colors.red[800]),
        ],
      ),
    );
  }

  Container buildRowStatCard1() {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildStatCard(messages[0], Colors.orangeAccent),
          SizedBox(width: kDefaultPadding),
          buildStatCard(messages[1], Colors.blue),
        ],
      ),
    );
  }

  Expanded buildStatCard(Message message, Color backgroundColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        height: kDefaultPadding * 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              message.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: kDefaultPadding - 3,
                  fontWeight: FontWeight.bold),
            ),
            Text(message.subtitle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: kDefaultPadding - 3,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final Statistic _statistic;
  final IconData iconData;
  const StatItem(this._statistic, {this.iconData});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: Theme.of(context).textTheme.bodyText2.color,
        fontWeight: FontWeight.bold,
        fontSize: 16.0);
    final rowColor = Theme.of(context).selectedRowColor;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: 24.0,
              height: 24.0,
              child: Icon(
                iconData,
                color: Colors.grey,
                size: 20.0,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: rowColor,
              ),
              child: Text(_statistic.country, style: textStyle),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: rowColor,
              ),
              child: Text(_statistic.confirmed, style: textStyle),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                margin: EdgeInsets.only(right: 8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: rowColor,
                ),
                child: Text(_statistic.death, style: textStyle)),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: rowColor,
              ),
              child: Text(_statistic.recovered, style: textStyle),
            ),
          ),
        ],
      ),
    );
  }
}
