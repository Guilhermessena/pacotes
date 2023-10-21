import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityPlusPage extends StatefulWidget {
  const ConnectivityPlusPage({super.key});

  @override
  State<ConnectivityPlusPage> createState() => _ConnectivityPlusPageState();
}

class _ConnectivityPlusPageState extends State<ConnectivityPlusPage> {
  late StreamSubscription subscription;
  @override
  initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print(result);
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Info Conectividade'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final connectivityResult =
                  await (Connectivity().checkConnectivity());
              if (connectivityResult == ConnectivityResult.mobile) {
                // I am connected to a mobile network.
              } else if (connectivityResult == ConnectivityResult.wifi) {
                // I am connected to a wifi network.
              } else if (connectivityResult == ConnectivityResult.ethernet) {
                // I am connected to a ethernet network.
              } else if (connectivityResult == ConnectivityResult.vpn) {
                // I am connected to a vpn network.
                // Note for iOS and macOS:
                // There is no separate network interface type for [vpn].
                // It returns [other] on any device (also simulator)
              } else if (connectivityResult == ConnectivityResult.bluetooth) {
                // I am connected to a bluetooth.
              } else if (connectivityResult == ConnectivityResult.other) {
                // I am connected to a network which is not in the above mentioned networks.
              } else if (connectivityResult == ConnectivityResult.none) {
                // I am not connected to any network.
              }
            },
            child: const Text('Teste Conexão'),
          ),
        ],
      ),
    ));
  }
}
