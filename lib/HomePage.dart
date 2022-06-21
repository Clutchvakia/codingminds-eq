import 'package:flutter/material.dart';
import 'config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPreset = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedPreset = index;
    });
    print(_selectedPreset);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/images/Logo.png'),
        ),
      ),
      body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: GestureDetector(
                    onTap: () {_onItemTapped(1);}, // Image tapped
                    child: Image.asset(
                      'assets/images/1.png',
                    ),
                  )),
                  Expanded(child: GestureDetector(
                    onTap: () {_onItemTapped(2);}, // Image tapped
                    child: Image.asset(
                      'assets/images/2.png',
                    ),
                  )),
                ]
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: GestureDetector(
                    onTap: () {_onItemTapped(3);}, // Image tapped
                    child: Image.asset(
                      'assets/images/3.png',
                    ),
                  )),
                  Expanded(child: GestureDetector(
                    onTap: () {_onItemTapped(4);}, // Image tapped
                    child: Image.asset(
                      'assets/images/4.png',
                    ),
                  )),
                ]
              ),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: GestureDetector(
                      onTap: () {_onItemTapped(5);}, // Image tapped
                      child: Image.asset(
                        'assets/images/5.png',
                      ),
                    )),
                    Expanded(child: GestureDetector(
                      onTap: () {_onItemTapped(6);}, // Image tapped
                      child: Image.asset(
                        'assets/images/6.png',
                      ),
                    )),
                  ]
              ),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: GestureDetector(
                      onTap: () {_onItemTapped(7);}, // Image tapped
                      child: Image.asset(
                        'assets/images/7.png',
                      ),
                    )),
                    Expanded(child: GestureDetector(
                      onTap: () {_onItemTapped(8);}, // Image tapped
                      child: Image.asset(
                        'assets/images/8.png',
                      ),
                    )),
                  ]
              ),
            ),
          ]
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: (){
      //     currentTheme.switchTheme();
      //   },
      //   label: Text('Switch Theme'),
      //   icon: Icon(Icons.brightness_high)
      // ),
    );
  }
}