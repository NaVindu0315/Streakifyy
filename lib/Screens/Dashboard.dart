import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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
  String event1 = "";
  String event2 = "";
  int count1 = 0;
  int count2 = 0;
  String c1 = "";
  String c2 = "";

  late DatabaseReference _event1;
  late DatabaseReference _event2;
  late DatabaseReference _count1;
  late DatabaseReference _count2;

  ///functiions to set values
  Future<void> reset1() async {
    await _count1.set(0);
  }

  Future<void> reset2() async {
    await _count2.set(0);
  }

  @override
  void initState() {
    super.initState();

    _event1 = FirebaseDatabase.instance.reference().child('test/gym/event');
    _event2 = FirebaseDatabase.instance.reference().child('test/diet/event');
    _count1 = FirebaseDatabase.instance.reference().child('test/gym/count');
    _count2 = FirebaseDatabase.instance.reference().child('test/diet/count');

    _event1.onValue.listen((event) {
      final snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          event1 = snapshot.value.toString();
        });
      }
    });
    _event2.onValue.listen((event) {
      final snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          event2 = snapshot.value.toString();
        });
      }
    });
    _count1.onValue.listen((event) {
      final snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          c1 = snapshot.value.toString();
          count1 = int.parse(c1);
        });
      }
    });
    _count2.onValue.listen((event) {
      final snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          c2 = snapshot.value.toString();
          count2 = int.parse(c2);
        });
      }
    });
  }

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
            ///first event
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
                        event1,
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
              height: 20.0,
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
                        '$count1',
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
                Spacer(),

                ///reset button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Add this to set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    reset1();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // To ensure the button doesn't take up too much space
                    children: [
                      Icon(
                        Icons.lock_reset, // Add the icon
                        size: 24.0, // Change the icon size
                        color: Colors.white, // Change the icon color
                      ),
                      Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white, // Change the text color
                          fontSize: 18.0, // Change the text size
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),

                ///decrease button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Add this to set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // To ensure the button doesn't take up too much space
                    children: [
                      Icon(
                        Icons.exposure_minus_1, // Add the icon
                        size: 24.0, // Change the icon size
                        color: Colors.white, // Change the icon color
                      ),
                      Text(
                        'Day',
                        style: TextStyle(
                          color: Colors.white, // Change the text color
                          fontSize: 18.0, // Change the text size
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),

                ///increase button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Add this to set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // To ensure the button doesn't take up too much space
                    children: [
                      Icon(
                        Icons.plus_one, // Add the icon
                        size: 24.0, // Change the icon size
                        color: Colors.white, // Change the icon color
                      ),
                      Text(
                        'Day',
                        style: TextStyle(
                          color: Colors.white, // Change the text color
                          fontSize: 18.0, // Change the text size
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),
              ],
            ),

            ///second event
            SizedBox(
              height: 50,
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
                        event2,
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
              height: 20.0,
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
                        '$count2',
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
                Spacer(),

                ///reset button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Add this to set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    reset2();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // To ensure the button doesn't take up too much space
                    children: [
                      Icon(
                        Icons.lock_reset, // Add the icon
                        size: 24.0, // Change the icon size
                        color: Colors.white, // Change the icon color
                      ),
                      Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white, // Change the text color
                          fontSize: 18.0, // Change the text size
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),

                ///decrease button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Add this to set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // To ensure the button doesn't take up too much space
                    children: [
                      Icon(
                        Icons.exposure_minus_1, // Add the icon
                        size: 24.0, // Change the icon size
                        color: Colors.white, // Change the icon color
                      ),
                      Text(
                        'Day',
                        style: TextStyle(
                          color: Colors.white, // Change the text color
                          fontSize: 18.0, // Change the text size
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),

                ///increase button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Add this to set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // To ensure the button doesn't take up too much space
                    children: [
                      Icon(
                        Icons.plus_one, // Add the icon
                        size: 24.0, // Change the icon size
                        color: Colors.white, // Change the icon color
                      ),
                      Text(
                        'Day',
                        style: TextStyle(
                          color: Colors.white, // Change the text color
                          fontSize: 18.0, // Change the text size
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
