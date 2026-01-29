import 'package:bwin_awale_game_app/core/widgets/custom_bottom_navigation.dart';
import 'package:bwin_awale_game_app/screens/arena/arena_screen.dart';
import 'package:bwin_awale_game_app/screens/home/home_screen.dart';
import 'package:bwin_awale_game_app/screens/wallet/wallet_screen.dart';
import 'package:bwin_awale_game_app/screens/friends/friends_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  final int initialIndex;
  const TabScreen({super.key, this.initialIndex = 0});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const ArenaScreen(),
    const WalletScreen(),
    const FriendsScreen(),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
