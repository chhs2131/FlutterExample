import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];

  void onClicked() {
    setState(() { // state에게 새로운 데이터가 있다는 사실을 전달하는 함수 -> 화면 refresh를 위해 build()가 새로 실행됨
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: Colors.red,
              )
          )
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              MyLargeTitle(),
              Text('${numbers.length}'),
              // for(var n in numbers) Text('$n'),
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

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _MyLargeTitleState();
  }
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  void initState() {
    // 구독 시작. 생성될때 실행할 구문
    super.initState();
  }

  @override
  void dispose() {
    // 구독 취소. 삭제될때 실행할 구문
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showTitle ? Text("click count", style: TextStyle(
            fontSize: 30, color: Theme
            .of(context)
            .textTheme
            .titleLarge!
            .color), // null에 대해서 !는 무조건있다. ?는 있으면 행해라!
        ) : const Text(""),
        IconButton(onPressed: toggleTitle, icon: Icon(Icons.remove_red_eye),),
      ],
    );
  }
}
