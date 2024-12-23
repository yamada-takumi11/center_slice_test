import 'package:flutter/material.dart';
import 'package:flutter_test_1/main.dart';

class ParentWidget2 extends StatelessWidget {
  const ParentWidget2({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return OriginalScaffold(
        title: title,
        body: SizedBox(
          width: 400,
          height: 500,
          child: Image.asset(
            'assets/centerSlice.png',
            //画像サイズは256x256の正方形
            width: 300,
            height: 400, centerSlice: const Rect.fromLTRB(64, 64, 192, 192),
          ),
        ));
  }
}
