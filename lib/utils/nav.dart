import 'package:flutter/material.dart';

push(context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}

pushReplacement(context, Widget page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}
