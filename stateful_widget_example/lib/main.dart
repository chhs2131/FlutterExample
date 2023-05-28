import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    setState(() {  // state에게 새로운 데이터가 있다는 사실을 전달하는 함수 -> 화면 refresh를 위해 build()가 새로 실행됨
      counter++;  // setState 외부에 있어도 동작에는 지장이 없지만, 가독성을 위해 내부로 넣어준다.
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
              children: [
                const Text("click count", style:TextStyle(fontSize:30)),
                Text('$counter'),
                IconButton(
                  onPressed: onClicked,
                  icon: const Icon(Icons.add_box_rounded),
                )
              ],
            ),
        ),
      ),
    );
  }
}
