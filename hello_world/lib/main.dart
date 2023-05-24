// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('first app'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    ); // 사용할 스타일(material(구글) or cupertino(애플))을 return 해야한다.
  }
}
