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
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 100.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  // <--- Add this
                  borderRadius: BorderRadius.circular(
                      60.0), // adjust the value to your liking
                ),
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
            SizedBox(
              height: 40.0,
            ),

            ///to display count
            SizedBox(
              height: 100.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  // <--- Add this
                  borderRadius: BorderRadius.circular(
                      30.0), // adjust the value to your liking
                ),
                color: Colors.orange,
                child: Container(
                  width:
                      200.0, // This will make the Card take up all the available space in the row
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // <--- Add this
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                // Rounded ElevatedButton
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('+1 Day'),
                ),

// Rounded OutlinedButton
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('-1 Day'),
                ),

// Rounded ElevatedButton for Reset
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Reset'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
