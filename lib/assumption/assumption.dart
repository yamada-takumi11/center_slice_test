import 'package:flutter/material.dart';
import 'package:flutter_test_1/main.dart';

class Assumption extends StatelessWidget {
  const Assumption({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return OriginalScaffold(
        title: title,
        body: Image.asset(
          'assets/centerSlice.png',
          //画像サイズは256x256の正方形
        ));
  }
}
