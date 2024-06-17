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
        appBar: AppBar(
          // preferredSize: Size.fromHeight(kToolbarHeight + 20),
          backgroundColor: Colors.green,
          /* leading: IconButton(
            icon: Icon(Icons.monitor_heart_rounded),
            onPressed: () {
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Emp_Dashboard()),
              ); // go back to the previous screen
           */
            },
          ),*/

          title: Center(
            child: Text(
              'Streakifyy',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),

          //centerTitle: true,
        ),
        body: Column(
          children: [
            Spacer(),
            /* Row(
              children: [
                Spacer(),
                Text('Test'),
                Spacer(),
              ],
            ),*/
            SizedBox(
              height: 100.0,
              child: Card(
                color: Colors.green,
                child: Container(
                  width: double
                      .infinity, // This will make the Card take up all the available space in the row
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // <--- Add this
                    children: [
                      Text(
                        'Event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
