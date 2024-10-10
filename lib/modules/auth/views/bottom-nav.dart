import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swd_app/modules/auth/view-model/auth-view-model.dart';
import 'package:swd_app/modules/auth/views/home-screen.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: IndexedStack(
        index: navProvider.currentIndex,
        children: [
          HomeScreen(),
          ServicesScreen(),
          StatisticsScreen(),
          ReferralsScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Black background
        type: BottomNavigationBarType.fixed,
        currentIndex: navProvider.currentIndex,
        selectedItemColor: Colors.white, // Selected item text color
        unselectedItemColor: Colors.grey, // Unselected item text color
        onTap: (index) {
          navProvider
              .updateIndex(index); // Update the current index with Provider
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/services.png',
              height: 24,
            ),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/statistics.png',
              height: 24,
            ),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/referral.png',
              height: 24,
            ),
            label: 'Referrals',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/settings.png',
              height: 24,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Services Screen'));
  }
}

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Statistics Screen'));
  }
}

class ReferralsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Referrals Screen'));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Screen'));
  }
}

/*import 'package:flutter/material.dart';
import 'package:swd_app/modules/auth/views/home-screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  // List of pages to display when each tab is selected
  final List<Widget> _pages = [
    HomeScreen(),
    ServicesScreen(),
    StatisticsScreen(),
    ReferralsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Black background
        type: BottomNavigationBarType
            .fixed, // Ensure the labels are always visible
        currentIndex: _currentIndex, // Current active tab
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the index on tab click
          });
        },
        selectedItemColor: Colors.white, // White color for selected item
        unselectedItemColor: Colors.white, // Grey color for unselected items
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  'assets/images/home.png', // Replace with your home icon path
                  height: 24, // Adjust image size
                ),
                Text(
                  'Home',
                  selectionColor: Colors.white,
                ),
              ],
            ),
            label: '', // Empty to avoid duplicate text with Column text
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  'assets/images/services.png', // Replace with your services icon path
                  height: 24,
                ),
                Text('Services'),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  'assets/images/statistics.png', // Replace with your statistics icon path
                  height: 24,
                ),
                Text('Statistics'),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  'assets/images/referral.png', // Replace with your referrals icon path
                  height: 24,
                ),
                Text('Referrals'),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  'assets/images/settings.png', // Replace with your settings icon path
                  height: 24,
                ),
                Text('Settings'),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

// Dummy screens for each section

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Services Screen'));
  }
}

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Statistics Screen'));
  }
}

class ReferralsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Referrals Screen'));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Screen'));
  }
} */
