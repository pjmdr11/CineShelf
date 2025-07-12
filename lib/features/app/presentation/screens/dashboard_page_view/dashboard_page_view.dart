import 'package:flutter/material.dart';

class DashboardPageView extends StatelessWidget {
  final Widget child;
  const DashboardPageView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
      body: child,
    );
  }
}
