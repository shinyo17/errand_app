import 'package:errand_app/common/component/logo.dart';
import 'package:errand_app/common/const/colors.dart';
import 'package:errand_app/common/layout/default_layout.dart';
import 'package:errand_app/home/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootTab extends StatefulWidget {
  static String get routeName => "home";
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController tabCtrl;
  int index = 0;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 4, vsync: this);
    tabCtrl.addListener(tabListener);
  }

  @override
  void dispose() {
    tabCtrl.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = tabCtrl.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabCtrl,
        children: [
          HomePage(),
          Center(
            child: Container(
              child: Text("2"),
            ),
          ),
          Center(
            child: Container(
              child: Text("3"),
            ),
          ),
          Center(
            child: Container(
              child: Text("4"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: GREY900,
        unselectedItemColor: GREY400,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        // shifting 선택된 탭이 조금 더 크게 표현됨
        onTap: (int index) {
          tabCtrl.animateTo(index);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble),
            activeIcon: Icon(CupertinoIcons.chat_bubble_fill),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            activeIcon: Icon(CupertinoIcons.person_solid),
            label: "",
          ),
        ],
      ),
    );
  }
}
