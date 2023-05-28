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
    setState(() {  // state에게 새로운 데이터가 있다는 사실을 전달하는 함수 -> 화면 refresh를 위해 build()가 새로 실행됨
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

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {  // context를 이용하여 부모요소에 접근할 수 있다.
    return Text("click count", style:TextStyle(
        fontSize:30, color: Theme.of(context).textTheme.titleLarge!.color),  // null에 대해서 !는 무조건있다. ?는 있으면 행해라!
    );
  }
}
