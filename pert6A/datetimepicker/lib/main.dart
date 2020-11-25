import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dateFormat.format(selectedDate),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      showDate(context);
                    },
                    child: Text(
                      'Date Picker',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedTime.format(context),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      showTime(context);
                    },
                    child: Text(
                      'Time Picker',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: FlatButton(
                color: Colors.blue,
                onPressed: () {
                  showData();
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDate(context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate.subtract(
        Duration(days: 30),
      ),
      lastDate: DateTime(selectedDate.year + 1),
    );

    if (datePick != null) {
      setState(() {
        selectedDate = datePick;
      });
    }
  }

  showTime(context) async {
    final timePick = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });
    if (timePick != null) {
      setState(() {
        selectedTime = timePick;
      });
    }
  }

  showData() {
    final birthday = DateTime(2001, 01, 29);
    // final birthday = DateTime(2020, 11, 02);
    final currentDate = DateTime.now();
    final difference = currentDate.difference(birthday).inDays * 24 * 60 * 3600;
    print(difference);
  }
}
