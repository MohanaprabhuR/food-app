import 'package:flutter/material.dart';
import 'colors.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, primaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?uid=R88479432&ga=GA1.1.1578571091.1698145536&semt=ais_hybrid&w=740",
                ),
              ),
              decoration: BoxDecoration(color: Colors.transparent),
              accountName: Text(
                "Mohanaprabhu R",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              accountEmail: Text(
                "mohan@timeless.co",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            MenuList(title: "Orders", iconName: Icons.border_color),
            MenuList(title: "Address", iconName: Icons.bookmark),
            MenuList(title: "Notifications", iconName: Icons.notifications),
            MenuList(title: "Help", iconName: Icons.help),
            MenuList(title: "About", iconName: Icons.account_box),
            MenuList(title: "Rate Us", iconName: Icons.star_half),
            MenuList(title: "Log Out", iconName: Icons.exit_to_app),
          ],
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final String title;
  final IconData iconName;

  const MenuList({required this.title, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(iconName, color: Colors.white),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
