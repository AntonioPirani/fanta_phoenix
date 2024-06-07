import 'package:flutter/material.dart';

import 'package:fanta_phoenix/src/features/home/presentation/home_screen.dart';
import 'package:fanta_phoenix/src/features/classifica/presentation/classifica_screen.dart';
import 'package:fanta_phoenix/src/features/inserimento/presentation/formazione/formazione_screen.dart';
import 'package:fanta_phoenix/src/features/risultati/presentation/risultati_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fanta_phoenix/src/features/menu_laterale/presentation/custom_drawer.dart';

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
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.purple[700],
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              print("Apri il profilo");
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(
        isAdminVisible: true, // * da cambiare in base all'utente loggato
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