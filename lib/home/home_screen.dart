import 'package:flutter/material.dart';
import 'package:islamyapp/app_colors.dart';
import 'package:islamyapp/tabs/hadeth/hadeth_tab.dart';
import 'package:islamyapp/tabs/quran/quran_tab.dart';
import 'package:islamyapp/tabs/radio/radio_tab.dart';
import 'package:islamyapp/tabs/sebha/sebha_tab.dart';
import 'package:islamyapp/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex = 0;
  List<String> backgroundImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/${getBackgroundImage()}.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.primaryDark,
            ),
            child: BottomNavigationBar(
              currentIndex: SelectedIndex,
              onTap: (index) {
                setState(() {
                  SelectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 0,
                    imagepath: 'assets/images/icon_quran.png',
                  ),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 1,
                    imagepath: 'assets/images/icon_hadeth.png',
                  ),
                  label: 'Hadeth',
                ),
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 2,
                    imagepath: 'assets/images/icon_sebha.png',
                  ),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 3,
                    imagepath: 'assets/images/icon_radio.png',
                  ),
                  label: 'Radio',
                ),
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 4,
                    imagepath: 'assets/images/icon_time.png',
                  ),
                  label: 'Time',
                ),
              ],
            ),
          ),
          body: tabs[SelectedIndex],
        ),
      ],
    );
  }

  Widget builtItemInBottomNavBar(
      {required int index, required String imagepath}) {
    return SelectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackBgColor,
            ),
            child: ImageIcon(
              AssetImage(imagepath),
            ),
          )
        : ImageIcon(
            AssetImage(imagepath),
          );
  }

  getBackgroundImage() {
    switch (SelectedIndex) {
      case 0:
        return 'quran_bg';
      case 1:
        return 'hadeth_bg';
      case 2:
        return 'sebha_bg';
      case 3:
        return 'radio_bg';
      case 4:
        return 'time_bg';
      default:
        return 'quran_bg';
    }
  }
}
