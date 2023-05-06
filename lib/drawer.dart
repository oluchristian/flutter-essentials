import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ughagwu Oluchukwu'),
              accountEmail: Text('oluchristian98@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3V5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text('Ughagwu Oluchukwu'),
              subtitle: Text('Developer'),
              trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text('Email'),
              subtitle: Text('oluchristian98@gmail.com'),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),
      );
  }
}