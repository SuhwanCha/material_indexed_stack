import 'package:flutter/material.dart';
import 'package:material_indexed_stack/material_indexed_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  late final List<Widget> _pages = [
    NavigatorPage(
      child: const FirstScroll(),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
    NavigatorPage(
      child: const SecondScroll(),
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            label: 'First',
            icon: Icon(
              Icons.ac_unit,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Second',
            icon: Icon(
              Icons.access_alarm,
            ),
          ),
        ],
        onTap: (value) => setState(() {
          _index = value;
        }),
      ),
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
    );
  }
}

class FirstScroll extends StatelessWidget {
  const FirstScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: RootPrimaryScrollController.of(context),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          color: Colors.yellow[index % 2 == 1 ? 400 : 700],
          child: Text('$index'),
        );
      },
    );
  }
}

class SecondScroll extends StatelessWidget {
  const SecondScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: RootPrimaryScrollController.of(context),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          color: Colors.purple[index % 2 == 1 ? 400 : 700],
          child: Text('$index'),
        );
      },
    );
  }
}
