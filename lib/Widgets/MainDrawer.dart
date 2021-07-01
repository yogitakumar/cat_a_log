import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        CircleAvatar(
            radius: 50,
            child: Image.network(
                "https://avatarfiles.alphacoders.com/163/163641.jpg")),
        ListTile(
          onTap: () {},
          title: Text("Home Page"),
          leading: Icon(
            Icons.home,
            color: Colors.blue,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text("Your Orders"),
          leading: Icon(
            Icons.format_list_numbered,
            color: Colors.blue,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text("Favorites"),
          leading: Icon(
            Icons.favorite,
            color: Colors.blue,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text("Profile"),
          leading: Icon(
            Icons.person,
            color: Colors.blue,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text("Settings"),
          leading: Icon(
            Icons.settings,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
