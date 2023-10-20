import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pacotes/pages/auto_size_text/auto_size_text_page.dart';
import 'package:pacotes/pages/percent_indicator/percent_indicator_page.dart';

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
            onTap: () {},
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
            onTap: () {},
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
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const ConfiguracoesHivePage(),
              //     ));
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
        ],
      ),
    );
  }
}
