import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './auth_screen.dart';
import './past_order_screen.dart';
import './home_screen.dart';
import './in_progress_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const routeName = "/bottom-navigation";
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const InProgressScreen(),
    const PastOrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBody: false,
      appBar: AppBar(
        title: Text(
          "Jingola Chef",
          textScaleFactor: 1,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then(
                (value) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AuthScreen.routeName,
                    (route) => false,
                  );
                },
              );
            },
            child: Text(
              "Logout",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                  ),
              textScaleFactor: 1,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fiber_new,
            ),
            label: "New Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work_history,
            ),
            label: "In Progress Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle,
            ),
            label: "Completed Orders",
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}
