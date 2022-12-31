import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/language/ar.dart';
import 'package:untitled/language/en.dart';
import 'package:untitled/utilis/4.1%20my_string.dart';

class LocalizationApp extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>{
    eng:en,
    ara:ar,


  };

}