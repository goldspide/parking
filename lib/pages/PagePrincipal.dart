import 'package:flutter/material.dart';
import 'package:park/pages/EditProfile.dart';
import 'package:park/pages/Location.dart';
import 'package:park/pages/Contact.dart';
import 'package:park/pages/HomePage.dart';
import 'package:park/pages/liste.dart';
import 'package:park/pages/Reservation.dart';
import 'package:park/utils/colors.dart';

class PagePrincipal extends StatefulWidget {
  const PagePrincipal({Key? key}) : super(key: key);

  @override
  State<PagePrincipal> createState() => _PagePrincipalState();
}

class _PagePrincipalState extends State<PagePrincipal> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //Affiche les page en fonction des index
        child: [
          const Expanded(
              child: SingleChildScrollView(
            child: HomePage(),
          )),
          location(),
          Reservation(),
          Contact(),
          Liste()

        ][_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
        selectedItemColor: AppColors.pureColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'position',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Reservation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail_rounded),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
      ),
    );
  }
}
