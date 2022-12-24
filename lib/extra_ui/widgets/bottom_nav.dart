// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:project3/Auth/Auth_provider.dart';
// import 'package:project3/Auth/Screens/main_screen.dart';
// import 'package:project3/extra_ui/main_customer_screen.dart';
// import 'package:provider/provider.dart';

// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> pages = [
//       MainScreen(),
//       MainCustomerScreen(),
   
//     ];
//     return BottomNavigationBar(
//         currentIndex:
//             Provider.of<AuthProvider>(context, listen: false).pageIndex,
//         onTap: (index) {
//           Provider.of<AuthProvider>(context, listen: false).pageIndex = index;
//         },
//         iconSize: 20,
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.pink,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//         unselectedItemColor: const Color.fromARGB(255, 209, 205, 205),
//         unselectedLabelStyle:
//             const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
//         selectedLabelStyle:
//             const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
//         // ignore: prefer_const_literals_to_create_immutables
//         items: [
//           const BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home_outlined,
//             ),
//             label: 'Home',
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//             ),
//             label: 'My Profile',
//           ),
         
//         ]);
//   }
// }