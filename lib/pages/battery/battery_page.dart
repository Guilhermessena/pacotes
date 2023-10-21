import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  var battery = Battery();

  var statusBattery = 0;

  @override
  void initState() {
    initPage();
    battery.onBatteryStateChanged.listen((BatteryState state) {});
    super.initState();
  }

  initPage() async {
    statusBattery = await battery.batteryLevel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Status Bateria: $statusBattery'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 50,
            animation: true,
            lineHeight: 20.0,
            animationDuration: 2000,
            percent: statusBattery / 100,
            center: Text("$statusBattery%"),
            progressColor: Colors.greenAccent,
          ),
        ],
      ),
    ));
  }
}
