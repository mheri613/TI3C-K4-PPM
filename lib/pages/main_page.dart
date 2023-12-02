import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ti3c_k4_ppm/pages/category_page.dart';
import 'package:ti3c_k4_ppm/pages/home_page.dart';
import 'package:ti3c_k4_ppm/pages/transaction_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [const HomePage(), const CategoryPage()];
  int currentIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //tanggal dan waktu
        appBar: (currentIndex == 0)
            ? CalendarAppBar(
                accent: const Color.fromARGB(255, 48, 206, 53),
                backButton: false,
                locale: 'id',
                onDateChanged: (value) => print(value),
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now(),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 36,
                    horizontal: 16,
                  ),
                  child: Text('Categories',
                      style: GoogleFonts.montserrat(fontSize: 20)),
                ))),
        //bagian paling bawah
        floatingActionButton: Visibility(
          visible: (currentIndex == 0) ? true : false,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => const TransactionPage(),
                ),
              )
                  .then((value) {
                setState(() {});
              });
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ),
        body: _children[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  onTapTapped(0);
                },
                icon: const Icon(Icons.home)),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  onTapTapped(1);
                },
                icon: const Icon(Icons.list))
          ]),
        ));
  }
}
