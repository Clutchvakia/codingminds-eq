import 'package:flutter/material.dart';
import 'package:equalizer/equalizer.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool enableCustomEQ = false;

  @override
  void initState(){
    super.initState();
    Equalizer.init(0);
  }

  @override
  void dispose(){
    Equalizer.release();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar'))
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1DB954),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 36.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 16,
                  child: Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Center(child: Text('Create your custom EQ')),
                        SizedBox(height: 20),
                        Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              debugPrint('Card tapped.');

                            },
                            child:const SizedBox(
                              width: 200,
                              height:30,
                              child: Text('EQ 1: Edit'),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            },
      ),
    );
  }
  // Widget _buildRow(String imageAsset, String name, editEQ) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //     child: Column(
  //       children: <Widget>[
  //         SizedBox(height: 12),
  //         Container(height: 2, color: Colors.redAccent),
  //         SizedBox(height: 12),
  //         Row(
  //           children: <Widget>[
  //             CircleAvatar(backgroundImage: AssetImage(imageAsset)),
  //             SizedBox(width: 12),
  //             Text(name),
  //             Spacer(),
  //             Container(
  //               decoration: BoxDecoration(color: Colors.yellow[900], borderRadius: BorderRadius.circular(20)),
  //               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
  //               child: Text(editEQ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
// Expanded(child: GestureDetector(
//   onTap: () {_onItemTapped(7);}, // Image tapped
//   child: Row(
//     children: const <Widget>[
//       Expanded(
//         child: Text('assets/choc.png'),
//       )
//     ]
//   ),
// )),