import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //tanggal dan waktu
      appBar: CalendarAppBar(
        accent: const Color.fromARGB(255, 48, 206, 53),
        backButton: false,
        locale: 'id',
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now(),
      ),
      //bagian paling bawah
      floatingActionButton: FloatingActionButton(
        onPressed: (){}, 
        backgroundColor: Colors.green, 
        child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, bottomNavigationBar: BottomAppBar(
          child: 
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            SizedBox(
              width: 20,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.list))
            ]),
            ));
  }
}