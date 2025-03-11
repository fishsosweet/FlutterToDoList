import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {

  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text('Chào bé Châu', style: TextStyle(fontSize: 30)),
      ),
      backgroundColor: Color.fromARGB(224, 130, 3, 241),
      foregroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 5,
      shadowColor: Color.fromARGB(255, 235, 5, 200),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
