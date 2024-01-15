import 'package:flutter/material.dart';

import 'features/LoginPage/Presentation/LoginPage.dart';

void main() {
  runApp(const Task());
}

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 219, 218, 218)),
      home: Scaffold(              
        appBar: AppBar(),
        body:const LoginPage(),
      ),
    );
  }
}
