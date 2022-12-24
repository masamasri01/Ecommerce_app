import 'package:flutter/material.dart';
import 'package:project3/Auth/Auth_provider.dart';
import 'package:project3/extra_ui/home_screen.dart';
import 'package:project3/extra_ui/profile.dart';
import 'package:provider/provider.dart';

class CustomerMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> pages = [
      HomeScreen(),
      Profile(),
    ];
    return Scaffold(
      //  appBar: AppBar(title: Text('Customer Page')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            Provider.of<AuthProvider>(context, listen: true).pageIndex,
        onTap: (value) {
          Provider.of<AuthProvider>(context, listen: false)
              .changePageIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'My Profile',
          ),
        ],
      ),
      body: pages[Provider.of<AuthProvider>(context).pageIndex],
    );
  }
}
