import 'package:flutter/material.dart';

import 'package:fanta_phoenix/src/features/home/presentation/home_screen.dart';
import 'package:fanta_phoenix/src/features/classifica/presentation/classifica_screen.dart';
import 'package:fanta_phoenix/src/features/inserimento/presentation/formazione/formazione_screen.dart';
import 'package:fanta_phoenix/src/features/risultati/presentation/risultati_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fanta_phoenix/src/features/home/presentation/navigazione_appbar.dart';

class NavigazioneScreen extends StatefulWidget{
  const NavigazioneScreen({super.key});

  @override
  State<NavigazioneScreen> createState() => _NavigazioneScreenState();
}

class _NavigazioneScreenState extends State<NavigazioneScreen>{
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const ClassificaScreen(),
    const FormazioneScreen(),
    const RisultatiScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Classifica',
    'Formazione',
    'Risultati'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigazioneAppbar.buildAppBar(
        title: _titles[_selectedIndex],
        leadingOnPressed: () {
          print('Menu button pressed');
        },
        trailingOnPressed: () {
          print('Account button pressed');
        },
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        // backgroundColor: Colors.blue, // non funziona
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.flagCheckered),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.trophy),
            label: 'Classifica',
          ),
          BottomNavigationBarItem(
            //icon: Image.asset('assets/images/icons/f1.png', width: 24, height: 24),
            icon: FaIcon(FontAwesomeIcons.car),
            label: 'Formazione',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.squarePollVertical),
            label: 'Risultati',
          ),
        ],
      ),
    );
  }
}