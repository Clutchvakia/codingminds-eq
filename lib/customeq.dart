import 'package:equalizer/equalizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

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
    int bandLevel = 0;
    return FutureBuilder<List<int>>(
      future: Equalizer.getCenterBandFreqs(),
      builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done ?
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data!.map(
                        (freq) => buildSlider(freq, bandLevel++),
                    ).toList(),
                  )
                ],
              ) : const CircularProgressIndicator();
        }
    );
  }

  Widget buildSlider(int freq, int bandLevel) {
    return Column(
      children: [
        SizedBox(
          height: 250.0,
          child: FutureBuilder<int>(
            future: Equalizer.getBandLevel(bandLevel),
            builder: (context, snapshot) {
              return FlutterSlider(
                disabled: !widget.enabled,
                axis : Axis.vertical,
                rtl : true,
                min : min,
                max : max,
                values: [snapshot.hasData ? snapshot.data!.toDouble() : 0],
                onDragCompleted: (handler, lower, upper) {
                  Equalizer.setBandLevel(bandLevel, lower.toInt());
                },
              );
            }
          )
        ),
        Text('${freq ~/ 1000} Hz')
      ],
    );
  }
}
