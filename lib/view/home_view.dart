import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninjanews/utils/generics/generics.dart';
import 'package:ninjanews/view/bulten_view.dart';
import 'package:ninjanews/view/search_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/widgets/get_news_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TabItem> items = const [
    TabItem(
      icon: Icons.home,
      title: 'Anasayfa',
    ),
    TabItem(
      icon: Icons.search_sharp,
      title: 'Ara',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'Favori',
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Market',
    ),
    TabItem(
      icon: Icons.account_box,
      title: 'Profil',
    ),
  ];
  int visit = 0;

  void _openLink() async {
    const url = 'https://nonfungibledesigns.io/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Link açılamadı: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      GetNewsWidget(),
      const SearchPage(),
      BultenWidget(),
      ElevatedButton(
        onPressed: _openLink,
        child: const Text('Linki Aç'),
      ),
      const Icon(
        Icons.accessibility_outlined,
        size: 150,
        color: Colors.white,
      ),
    ];

    void _onItemTapped(int index) {
      if (index == 3) {
        _openLink();
      } else {
        setState(() {
          visit = index;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              ' Ninja News',
              style: TextStyle(
                color: Color(Generics.ninjaNewsYellow),
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _pages.elementAt(visit),
      ),
      bottomNavigationBar: BottomBarCreative(
        items: items,
        backgroundColor: Colors.black,
        color: Colors.white,
        colorSelected: Color.fromRGBO(255, 211, 46, 1),
        indexSelected: visit,
        highlightStyle: const HighlightStyle(
          isHexagon: true,
        ),
        onTap: (int index) {
          if (index == 3) {
            _openLink();
          } else {
            setState(() {
              visit = index;
            });
          }
        },
      ),
    );
  }
}
