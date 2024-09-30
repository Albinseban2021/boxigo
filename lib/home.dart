import 'package:boxigo/in_progress.dart';
import 'package:boxigo/list_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedBottomNavIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedBottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leads'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        bottom: _selectedBottomNavIndex == 1
            ? TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.red,
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'New'),
                  Tab(text: 'Follow Up'),
                  Tab(text: 'Booked'),
                  Tab(text: 'In Transit'),
                ],
              )
            : null,
      ),
      body: _getSelectedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedBottomNavIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onBottomNavItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined), label: 'Leads'),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range_outlined), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  Widget _getSelectedScreen() {
    if (_selectedBottomNavIndex == 1) {
      return TabBarView(
        controller: _tabController,
        children: const [
          InProgress(),
          LeadListView(),
          InProgress(),
          InProgress(),
          InProgress(),
        ],
      );
    } else {
      return const InProgress();
    }
  }
}
