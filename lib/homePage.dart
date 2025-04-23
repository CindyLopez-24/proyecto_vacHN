//Pagina de menu
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
    required this.changePage,
    required this.currentPage,
  });
  final Function(int) changePage;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage,
      onTap: changePage, 
      selectedItemColor: Colors.teal[600],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfiles',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.app_registration),
          label: 'Registros',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.vaccines),
          label: 'Vacunas',
        ),
      ],
    );
  }
}
