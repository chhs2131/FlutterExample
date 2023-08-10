import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'image_example_page.dart';

void main() async {
  await Supabase.initialize(
      url: "https://xxxxxxxxxxxxxxxxxxxxxxxxxxxx.supabase.co",
      anonKey: "-----------------------------------------------------YourSupabaseApiKey-----------------------------------------------------",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ImageExamplePage(),
    );
  }
}
