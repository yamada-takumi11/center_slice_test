import 'package:flutter/material.dart';
import 'package:flutter_test_1/main.dart';

class ParentWidget3 extends StatelessWidget {
  const ParentWidget3({super.key, required this.title});
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
            fit: BoxFit.contain,
            centerSlice: const Rect.fromLTRB(64, 64, 192, 192),
          ),
        ));
  }
}
