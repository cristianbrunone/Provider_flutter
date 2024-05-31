import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Perfil",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      backgroundColor: Color.fromARGB(255, 0, 14, 171),
      elevation: 1,
      shadowColor: Colors.grey,
      leading: Icon(Icons.arrow_back, color: Colors.white),
      actions: [
        Icon(Icons.share, color: Colors.white),
        Icon(Icons.more_vert, color: Colors.white),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
