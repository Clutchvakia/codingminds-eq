import 'package:equalizer/equalizer.dart';
import 'package:flutter/material.dart';

class customeq extends StatefulWidget {
  const customeq({Key? key,
  required this.enabled,
  required this.bandLevelRange}) : super(key: key);
  final bool enabled;
  final List<int> bandLevelRange;

  @override
  _customeqState createState() => _customeqState();
}

class _customeqState extends State<customeq> {
  double? min, max;

  @override
  void initState(){
    super.initState();
    min = widget.bandLevelRange?[0].toDouble();
    max = widget.bandLevelRange?[1].toDouble();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: Equalizer.getCenterBandFreqs(),
      builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done ?
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data!.map(
                        (freq) => Container().toList();
                    ),
                  ),
                ],
              ),
        }
    );
  }
}
