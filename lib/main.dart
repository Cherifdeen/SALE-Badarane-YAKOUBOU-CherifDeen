import 'package:flutter/material.dart';
import 'pages/home_candidate_page.dart';
import 'pages/add_candidate_form.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tp election ',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0X5e8851)),
          useMaterial3: true,

      ),
      home: HomeCandidatePage(),
      routes: {
        '/addform' : (context) => AddCandidateForm(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
