import 'package:covid19/k.dart';
import 'package:covid19/screens/statistic/statistics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home/home.dart';

class MainCovidPage extends StatefulWidget {
  @override
  _MainCovidPageState createState() => _MainCovidPageState();
}

class _MainCovidPageState extends State<MainCovidPage> {
  String title = 'Covid-19';
  int _selectedIndex = 0;
  final _destinations = [Home(), Statistics(), Text('Report'), Text('Profile')];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        title = 'Statistics';
      } else if (index == 2) {
        title = 'Report';
      } else if (index == 3) {
        title = 'Profile';
      } else
        title = 'Covid-19';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              AppBar(
                title: title,
                index: _selectedIndex,
              )
            ];
          },
          body: Container(
            child: _destinations[_selectedIndex],
          )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem(
              'assets/icons/home.svg', 'Home', 'assets/icons/home_active.svg'),
          buildBottomNavigationBarItem('assets/icons/stats.svg', 'Statistic',
              'assets/icons/stats_active.svg'),
          buildBottomNavigationBarItem('assets/icons/report.svg', 'Report',
              'assets/icons/report_active.svg'),
          buildBottomNavigationBarItem('assets/icons/profile.svg', 'Profile',
              'assets/icons/profile_active.svg')
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String iconName, String title, String activeIconName) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(iconName,
            width: kDefaultPadding,
            height: kDefaultPadding,
            allowDrawingOutsideViewBox: true),
        title: Text(title),
        activeIcon: SvgPicture.asset(activeIconName,
            width: kDefaultPadding,
            height: kDefaultPadding,
            allowDrawingOutsideViewBox: true));
  }
}

class AppBar extends StatelessWidget {
  const AppBar({this.title, this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
        backgroundColor: index == 0
            ? Theme.of(context).primaryColor
            : Theme.of(context).scaffoldBackgroundColor,
        leading: Container(
            margin: EdgeInsets.only(left: 15.0),
            child: SvgPicture.asset('assets/icons/virus.svg')),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              iconSize: 12.0,
              color: index == 0
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1.color,
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
                width: 15.0,
                height: 15.0,
                color: index == 0
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyText1.color,
              ),
              onPressed: () {},
            ),
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 18.0,
                backgroundColor: index == 0 ? Colors.white : Colors.grey,
                child: CircleAvatar(
                  radius: 16.0,
                  backgroundImage: AssetImage('assets/images/img_person.png'),
                ),
              ),
            )
          ],
        ),
        largeTitle: Text(
          title,
          style: TextStyle(
              color: index == 0
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1.color,
              fontWeight: FontWeight.bold),
        ));
  }
}
