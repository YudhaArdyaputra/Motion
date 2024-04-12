import 'package:flutter/material.dart';
import 'package:motion/Screen/Dashboard.dart';
import 'package:motion/Screen/History.dart';
import 'package:motion/Screen/Profile.dart';
import 'package:motion/Screen/Report.dart';
import 'package:motion/Screen/addtypes.dart';
import 'package:motion/mahasiswa/mahasiswa_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // set initial screen index here

  final List<Widget> _screens = [
    const DashScreen(),
    const HistoryScreen(),
    const ReportScreen(),
    const ProfileScreen(),
  ];

  final List<String> _appBarTitles = const [
    "Home",
    "History",
    "Laporan Bulanan",
    "Profile",
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          child: Text(
              'MOTION',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
        ListTile(
          title: const Text('Latihan CRUD'),
          selected: _selectedIndex == 0,
          onTap: () {
            _onItemTapped(0);
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddTypes()),);;
          },
        ),
        ListTile(
          title: const Text('Latihan API'),
          selected: _selectedIndex == 0,
          onTap: () {
            _onItemTapped(0);
            Navigator.push(context, MaterialPageRoute(builder: (context) => MahasiswaScreen()),);;
          },
        ),
        ListTile(
          title: const Text('Home'),
          selected: _selectedIndex == 0,
          onTap: () {
            _onItemTapped(0);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Riwayat Transaksi'),
          selected: _selectedIndex == 1,
          onTap: () {
            // Update the state of the app
            _onItemTapped(1);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Laporan BUlanan'),
          selected: _selectedIndex == 2,
          onTap: () {
            // Update the state of the app
            _onItemTapped(2);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Profile'),
          selected: _selectedIndex == 3,
          onTap: () {
            _onItemTapped(3);
            Navigator.pop(context);
          },
        ),
      ])),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.black,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stairs_outlined,
              color: Colors.black,
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 62, 139, 255),
        onTap: _onItemTapped, // add onTap callback
      ),
    );
  }
}