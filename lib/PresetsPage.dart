import 'package:flutter/material.dart';

class PresetsPage extends StatefulWidget {
  const PresetsPage({Key? key}) : super(key: key);

  @override
  _PresetsPageState createState() => _PresetsPageState();
}

class _PresetsPageState extends State<PresetsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Color(0xFF1D82BC),
          child: const Center(child: Text('Normal', style: TextStyle(fontSize: 40),)),
        ),
        Container(
          height: 50,
          color: Color(0xFF757575),
          child: const Center(child: Text('Pop', style: TextStyle(fontSize: 40),)),
        ),
        Container(
          height: 50,
          color: Color(0xFF1D82BC),
          child: const Center(child: Text('Hip-Hop', style: TextStyle(fontSize: 40),)),
        ),
        Container(
          height: 50,
          color: Color(0xFF4582bc),
          child: const Center(child: Text('Country', style: TextStyle(fontSize: 40),)),
        ),
        Container(
          height: 50,
          color: Color(0xFF1D82BC),
          child: const Center(child: Text('R&B', style: TextStyle(fontSize: 40),)),
        ),
        Container(
          height: 50,
          color: Color(0xFF4582bc),
          child: const Center(child: Text('Dance/Electronic', style: TextStyle(fontSize: 40),)),
        ),
        Container(
          height: 50,
          color: Color(0xFF1D82BC),
          child: const Center(child: Text('Indie', style: TextStyle(fontSize: 40),)),
        ),
      ],
    );
  }
}