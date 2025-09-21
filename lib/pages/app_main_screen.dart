import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:libs_e_commerce_app/pages/home_screen.dart';
import 'package:libs_e_commerce_app/pages/user_profile/user_profile.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  final List pages = [
    const HomeScreen(),
    // const Scaffold(),
    // const Scaffold(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(
          //   icon: Icon(Iconsax.search_normal),
          //   label: 'Search',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Iconsax.notification),
          //   label: 'notifications',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}


/*

InkWell(
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).signOut();
                Navigator.pushReplacementNamed(context, 'login_screen');
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "LogOut",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

 */