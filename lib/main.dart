import 'package:flutter/material.dart';
import 'package:fyp_dev/login.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login': (context) => MyLogin()},
  )
  );
}