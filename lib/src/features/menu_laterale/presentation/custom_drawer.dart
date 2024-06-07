import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final bool isAdminVisible;
  const CustomDrawer({super.key, required this.isAdminVisible});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/icons/bandieraScacchi.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text(''),
                ),
                ListTile(
                  leading: const Icon(Icons.rule),
                  title: const Text('Regolamento'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: const Text('Calendario 2025'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.money),
                  title: const Text('Quotazioni Piloti e Scuderie'),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.comment),
                  title: const Text('Termini e Condizioni'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text('Privacy Policy'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.bug_report),
                  title: const Text('Segnala un Bug'),
                  onTap: () {},
                ),
                Visibility(
                  visible: widget.isAdminVisible,
                  child: ListTile(
                    leading: const Icon(Icons.admin_panel_settings),
                    title: const Text('Accesso Admin'),
                    onTap: () {},
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          const ListTile(
            title: Text('Versione App: 0.1'),
            enabled: false,
          ),
        ],
      ),
    );
  }
}
