import 'package:flutter/material.dart';
import 'package:shamo_app/config/theme.dart';
import 'package:shamo_app/pages/home/chat_page.dart';
import 'package:shamo_app/pages/home/home_page.dart';
import 'package:shamo_app/pages/home/love_page.dart';
import 'package:shamo_app/pages/home/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {},
        child: Image.asset(
          'assets/icons/ic_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: bgColor4,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 5.0,
                    ),
                    child: Image.asset(
                      'assets/icons/ic_home.png',
                      width: 21,
                      color: currentIndex == 0 ? primaryColor : bottomNavColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 5.0,
                    ),
                    child: Image.asset(
                      'assets/icons/ic_chat.png',
                      width: 20,
                      color: currentIndex == 1 ? primaryColor : bottomNavColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 5.0,
                    ),
                    child: Image.asset(
                      'assets/icons/ic_love.png',
                      width: 20,
                      color: currentIndex == 2 ? primaryColor : bottomNavColor,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 5.0,
                    ),
                    child: Image.asset(
                      'assets/icons/ic_profile.png',
                      width: 18,
                      color: currentIndex == 3 ? primaryColor : bottomNavColor,
                    ),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return LovePage();
        case 3:
          return ProfilePage();
        default:
          return HomePage();
      }
      ;
    }

    return Scaffold(
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      backgroundColor: bgColor1,
      body: body(),
    );
  }
}
