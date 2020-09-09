import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color mainLightColor = Color(0xFFF6DEEC);

var interestSelectionTextStyle = TextStyle(
    fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 18);

var loader = Center(
  child: Platform.isAndroid
      ? CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[100]),
        )
      : CupertinoActivityIndicator(),
);
