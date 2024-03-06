import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'products_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageActualCount = 1;
  late PageController pc;

  void initState() {
    super.initState();
    pc = PageController(initialPage: pageActualCount);
  }

  setPageActual(page) {
    setState(() {
      pageActualCount = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(
                'Stock',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromRGBO(25, 135, 84, 1)),
              ),
            )
          ],
        ),
      ),
      body: PageView(
        controller: pc,
        children: [
          ProfilePage(),
          SingleChildScrollView(child: ProductsUser()),
          MenuPage()
        ],
        onPageChanged: setPageActual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageActualCount,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
        onTap: (page) {
          pc.animateToPage(page,
              duration: Duration(milliseconds: 400), curve: Curves.linear);
        },
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Page 2'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Page 0'),
    );
  }
}
