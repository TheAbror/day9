import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _screenshotcontroller = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: _screenshotcontroller,
              child: Card(
                child: Column(
                  children: [
                    Image.asset('images/instalogo copy.jpg'),
                    Text(
                      'CODE Passionately',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: _takeScreenshot,
              child: Text(
                'TAKE & SHARE Screenshot',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _takeScreenshot() async {
    final imageFILE = await _screenshotcontroller.capture();
    Share.shareFiles([imageFILE.toString()]);
  }
}
