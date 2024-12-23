import 'package:flutter/material.dart';
import 'package:flutter_test_1/parent_widget/parent_widget_1.dart';
import 'package:flutter_test_1/parent_widget/parent_widget_2.dart';
import 'package:flutter_test_1/parent_widget/parent_widget_3.dart';
import 'package:flutter_test_1/parent_widget/parent_widget_4.dart';
import 'package:flutter_test_1/parent_widget/parent_widget_5.dart';
import 'package:flutter_test_1/expanded/expanded_1.dart';
import 'package:flutter_test_1/expanded/expanded_2.dart';
import 'package:flutter_test_1/assumption/assumption.dart';
import 'package:flutter_test_1/scale/scale_1.dart';
import 'package:flutter_test_1/scale/scale_2.dart';
import 'package:flutter_test_1/scale/scale_3.dart';
import 'package:flutter_test_1/scale/scale_4.dart';
import 'package:flutter_test_1/scale/scale_5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey,
        ),
        home: const MyHomePage(title: "centerSlice Test"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Container(
          color: Colors.white,
          child: Row(
            children: [
              Column(
                children: [
                  const Text(
                    '[assumption]',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Assumption(title: '[assumption] No1')));
                      },
                      child: const Text('[assumption] No1')),
                  const Text(
                    '[scale]',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scale1(title: '[scale] No1')));
                      },
                      child: const Text('[scale] No1')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scale2(title: '[scale] No2')));
                      },
                      child: const Text('[scale] No2')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scale3(title: '[scale] No3')));
                      },
                      child: const Text('[scale] No3')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scale4(title: '[scale] No4')));
                      },
                      child: const Text('[scale] No4')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scale5(title: '[scale] No5')));
                      },
                      child: const Text('[scale] No5')),
                ],
              ),
              Column(
                children: [
                  const Text(
                    '[parent_widget]',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ParentWidget1(title: '[parent_widget] No1')));
                      },
                      child: const Text('[parent_widget] No1')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ParentWidget2(title: '[parent_widget] No2')));
                      },
                      child: const Text('[parent_widget] No2')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ParentWidget3(title: '[parent_widget] No3')));
                      },
                      child: const Text('[parent_widget] No3')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ParentWidget4(title: '[parent_widget] No4')));
                      },
                      child: const Text('[parent_widget] No4')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ParentWidget5(title: '[parent_widget] No5')));
                      },
                      child: const Text('[parent_widget] No5')),
                ],
              ),
              Column(
                children: [
                  const Text(
                    '[expanded]',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Expanded1(title: '[expanded] No1')));
                      },
                      child: const Text('[expanded] No1')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Expanded2(title: '[expanded] No2')));
                      },
                      child: const Text('[expanded] No2')),
                ],
              )
            ],
          ),
        ));
  }
}

class OriginalScaffold extends StatelessWidget {
  const OriginalScaffold({super.key, required this.body, required this.title});
  final Widget body;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.grey,
      ),
      body: Stack(
        children: [body, const PixelRuler()],
      ),
    );
  }
}

class PixelRuler extends StatelessWidget {
  const PixelRuler({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // 縦方向の定規
        CustomPaint(
          size: Size(50, screenHeight),
          painter: VerticalRulerPainter(),
        ),
        // 横方向の定規
        CustomPaint(
          size: Size(screenWidth, 50),
          painter: HorizontalRulerPainter(),
        ),
      ],
    );
  }
}

class VerticalRulerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    const step = 10.0; // 目盛りの間隔
    for (double i = 0; i < size.height; i += step) {
      final lineLength = i % 50 == 0 ? 20.0 : 10.0;

      // 縦方向の目盛り
      canvas.drawLine(
        Offset(0, i),
        Offset(lineLength, i),
        paint,
      );

      // 縦方向の数字
      if (i % 50 == 0) {
        final text = TextSpan(
          text: i.toInt().toString(),
          style: const TextStyle(color: Colors.black, fontSize: 10),
        );
        textPainter.text = text;
        textPainter.layout();
        textPainter.paint(canvas, Offset(lineLength + 5, i - 6));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HorizontalRulerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    const step = 10.0; // 目盛りの間隔
    for (double i = 0; i < size.width; i += step) {
      final lineLength = i % 50 == 0 ? 20.0 : 10.0;

      // 横方向の目盛り
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, lineLength),
        paint,
      );

      // 横方向の数字
      if (i % 50 == 0) {
        final text = TextSpan(
          text: i.toInt().toString(),
          style: const TextStyle(color: Colors.black, fontSize: 10),
        );
        textPainter.text = text;
        textPainter.layout();
        textPainter.paint(canvas, Offset(i - 10, lineLength + 5));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
