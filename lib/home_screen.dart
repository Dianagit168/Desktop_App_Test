// import 'package:flutter/material.dart';

import 'package:desktop_app_test/provider/content_provider.dart';
import 'package:desktop_app_test/screen/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final String? appTitle = Provider.of<ContentProvider>(context).content;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ប្រព័ន្ធទូទាត់ប្រាក់ - $appTitle',
            style: const TextStyle(
                fontFamily: 'DAUNPENH',
                fontWeight: FontWeight.w600,
                fontSize: 27),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            // labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.white,

            labelColor: Colors.black,

            tabs: const [
              Text(
                'ការគ្រប់គ្រងអ្នកប្រើប្រាស់',
                style: TextStyle(
                    fontFamily: 'DAUNPENH',
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              Text(
                'ប្រតិបត្តិការ',
                style: TextStyle(
                    fontFamily: 'DAUNPENH',
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              Text(
                'ផ្សេងៗ',
                style: TextStyle(
                    fontFamily: 'DAUNPENH',
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Center(child: Text('ការគ្រប់គ្រងអ្នកប្រើប្រាស់')),
          Transaction(),
          Center(child: Text('ផ្សេងៗ')),
        ]),
      ),
    );
  }
}

// class HomeSreen extends StatefulWidget {
//   const HomeSreen({super.key});

//   @override
//   State<HomeSreen> createState() => _HomeSreenState();
// }

// class _HomeSreenState extends State<HomeSreen> {
//   int selectedIndex = 0;

//   List screenList = [
//     const Text('data'),
//     const Text('data'),
//     const Text('data'),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(238, 255, 255, 255),
//       body: screenList[selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blueAccent,
//         selectedFontSize: 12,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.ring_volume),
//             label: 'Library',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.ring_volume),
//             label: 'For You',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.ring_volume),
//             label: 'Albums',
//           ),
//         ],
//       ),
//     );
//   }
// }
