import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_cubit/score_cubit.dart';
import 'package:hydrated_cubit/score_state.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<ScoreCubit> (
        create: (_) => ScoreCubit(),
          child: Page1(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ScoreCubit, ScoreState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text("math: ${state.math}"),
                    Text("english: ${state.english}"),
                    Text("korean: ${state.korean}"),
                  ],
                );
              },
            ),
            OutlinedButton(
              onPressed: () {
                BlocProvider.of<ScoreCubit>(context).plus();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
              },
              child: Text("+1"),
            ),
            OutlinedButton(
              onPressed: () {
                BlocProvider.of<ScoreCubit>(context).reset();
              },
              child: Text("reset"),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          child: Text("back"),
        ),
      ),
    );
  }
}
