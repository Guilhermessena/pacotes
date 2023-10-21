import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pacotes/pages/auto_size_text/auto_size_text_page.dart';
import 'package:pacotes/pages/battery/battery_page.dart';
import 'package:pacotes/pages/camera/camera_page.dart';
import 'package:pacotes/pages/connectivity_plus/connectivity_plus_page.dart';
import 'package:pacotes/pages/geolocator/geolocator_page.dart';
import 'package:pacotes/pages/percent_indicator/percent_indicator_page.dart';
import 'package:pacotes/pages/qr_code/qr_code_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (context) {
                  return const Wrap(
                    children: [
                      ListTile(
                        title: Text("Camera"),
                        leading: Icon(Icons.photo_camera_outlined),
                      ),
                      ListTile(
                        title: Text("Galeria"),
                        leading: Icon(Icons.photo_library_outlined),
                      )
                    ],
                  );
                },
              );
            },
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.purple),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
              ),
              accountName: const Text("userguilherme"),
              accountEmail: const Text("email@gmail.com"),
            ),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.internetExplorer,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Abrir Dio"),
                  ],
                )),
            onTap: () async {
              await launchUrl(Uri.parse('https://web.dio.me'));
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.mapLocationDot,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Abrir Google Maps"),
                  ],
                )),
            onTap: () async {
              await launchUrl(
                  Uri.parse('google.navigation:q=Orlando FL&mode=d'));
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.shareNodes,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Compartilhar"),
                  ],
                )),
            onTap: () {
              Share.share('Olhem esse site! https://web.dio.me');
              Navigator.pop(context);
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.percent,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Indicador de Porcentagem"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PercentIndicatorPage(),
                  ));
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.batteryHalf,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Indicador de bateria"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BatteryPage(),
                ),
              );
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.newspaper,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Auto Size Text"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AutoSizeTextPage(),
                  ));
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.globe,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Intl"),
                  ],
                )),
            onTap: () {
              var f = NumberFormat('###.0#', 'en_US');
              var fBr = NumberFormat('###.0#', 'pt_BR');
              print(f.format(12.345));
              print(fBr.format(12.345));

              var data = DateTime(2022, 05, 09);
              print(DateFormat('EEEEE', 'en_US').format(data));
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.flag,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("pt-BR"),
                  ],
                )),
            onTap: () {
              if (context.locale.toString() == 'pt_BR') {
                context.setLocale(const Locale('en', 'US'));
              } else {
                context.setLocale(const Locale('pt', 'BR'));
              }
              setState(() {});
              Navigator.pop(context);
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.folder,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Path Provider"),
                  ],
                )),
            onTap: () async {
              setState(() {});
              var directory = await path_provider.getTemporaryDirectory();
              directory = await path_provider.getApplicationSupportDirectory();
              directory =
                  await path_provider.getApplicationDocumentsDirectory();
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.googlePlay,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Informações pacote"),
                  ],
                )),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;
              print('$appName  $packageName  $version  $buildNumber');
              print(Platform.operatingSystem);
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.mobileScreen,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Informações dispositivo"),
                  ],
                )),
            onTap: () async {
              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

              if (Platform.isAndroid) {
                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
              } else if (Platform.isIOS) {
                IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                print(
                    'Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
              } else {
                WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
                print('Running on ${webBrowserInfo.userAgent}');
              }
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.wifi,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Conectividade"),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConnectivityPlusPage(),
                  ));
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.mapPin,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("GPS"),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GeolocatorPage(),
                  ));
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.qrcode,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("QR Code"),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrCodePage(),
                  ));
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.camera,
                      color: Colors.blue,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Camera"),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CameraPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
