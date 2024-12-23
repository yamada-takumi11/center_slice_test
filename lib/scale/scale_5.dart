import 'package:flutter/material.dart';
import 'package:flutter_test_1/main.dart';

class Scale5 extends StatelessWidget {
  const Scale5({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return OriginalScaffold(
        title: title,
        body: Image.asset(
          'assets/centerSlice.png',
          //画像サイズは256x256の正方形
          width: 400,
          height: 500,
          scale: 0.5,
          centerSlice: const Rect.fromLTRB(128, 128, 384, 384),
        ));
  }
}
