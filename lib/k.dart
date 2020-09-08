import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0XFF503CAA);
const kAppYellow = Color(0xFFFFB306);
const kAppRed = Color(0xFFFF4D4D);

const homeBoxDecoration = BoxDecoration(
    color: kPrimaryColor,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    ));

const kDotsDecoration = DotsDecorator(
    activeColor: Colors.white,
    size: Size(7.0, 7.0),
    activeSize: Size(7.0, 7.0),
    spacing: EdgeInsets.all(4.0));

final kStatItemDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(4.0),
  color: Colors.grey[200],
);

const kDefaultPadding = 20.0;
