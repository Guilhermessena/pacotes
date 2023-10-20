import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var cepController = TextEditingController();
  var cpfController = TextEditingController();
  var centavosController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('CEP'),
            TextFormField(
              controller: cepController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            const Divider(),
            const Text('CPF'),
            TextFormField(
              controller: cpfController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            const Divider(),
            const Text('Centavos'),
            TextFormField(
              controller: centavosController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter(moeda: true),
              ],
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Continuar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
