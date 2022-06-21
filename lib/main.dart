import 'package:flutter/material.dart';
import 'package:testdemo/CreatePage.dart';
import 'package:testdemo/SettingsPage.dart';
import 'HomePage.dart';
import 'CreatePage.dart';
import 'SettingsPage.dart';
import 'package:settings_ui/settings_ui.dart';
import 'config.dart';
import 'package:equalizer/equalizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool enableCustomEQ = false;
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {});
    });
    Equalizer.init(0);
  }

  @override
  void dispose(){
    Equalizer.release();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    new HomePage(),
    new CreatePage(),
    new SettingsPage(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My App'),
      //   backgroundColor: Color(0xFF0B2E57),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFF797979),
        backgroundColor: Color(0xFF1DB954),
        elevation: 0,
        iconSize: 28,
        mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home,
                color: Colors.white
            ),
            label: 'Home',
            backgroundColor: Color(0xFF0B2E57),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.equalizer,
                color: Colors.white
            ),
            label: 'Create',
            backgroundColor: Color(0xFF0B2E57),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.settings,
                color: Colors.white
            ),
            label: 'Settings',
            backgroundColor: Color(0xFF0B2E57),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
