import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'image_example_page.dart';

void main() async {
  await Supabase.initialize(
      url: "https://rgxyosxqmjigodkzfnoo.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJneHlvc3hxbWppZ29ka3pmbm9vIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTE0OTE0ODQsImV4cCI6MjAwNzA2NzQ4NH0.CptSeKfrdjdE-71PCsdEjmx5zSI3A15zmwpvKKFCZxw",
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
