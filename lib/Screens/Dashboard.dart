import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashh(),
    );
  }
}

class Dashh extends StatefulWidget {
  const Dashh({Key? key}) : super(key: key);

  @override
  State<Dashh> createState() => _DashhState();
}

class _DashhState extends State<Dashh> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Spacer(),
            Row(
              children: [
                Spacer(),
                Text('Pako'),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
