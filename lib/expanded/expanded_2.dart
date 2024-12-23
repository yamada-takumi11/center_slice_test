import 'package:flutter/material.dart';
import 'package:flutter_test_1/main.dart';

class Expanded2 extends StatelessWidget {
  const Expanded2({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return OriginalScaffold(
        title: title,
        body: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/centerSlice.png',
                //画像サイズは256x256の正方形
                width: 256,
                height: 256,
                scale: 2,
                centerSlice: const Rect.fromLTRB(64, 64, 192, 192),
              ),
            ),
          ],
        ));
  }
}
