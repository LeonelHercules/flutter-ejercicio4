import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class cripto extends StatefulWidget {
  const cripto({super.key});

  @override
  State<cripto> createState() => _criptoState();
}

class _criptoState extends State<cripto> {
  String criptoinfo = '';
  String divisa = 'usd';
  List<String> divisas = <String>['usd', 'eur', 'gbp'];

  @override
  void initState() {
    super.initState();
    obtenerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Consulta cripto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: NetworkImage(
                  'https://blog.bitso.com/wp-content/uploads/2023/10/dolar-cripto.png'),
            ),
            Text(
              'Seleccione la divisa a consultar',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            _combo(),
            Text(
              divisa,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              criptoinfo.isNotEmpty
                  ? 'Precio del bitcoin:\$$criptoinfo'
                  : 'validando..',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Regresar')),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _combo() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              value: divisa,
              items: divisas.map<DropdownMenuItem<String>>((String valor) {
                return DropdownMenuItem<String>(
                  value: valor,
                  child: Text(valor),
                );
              }).toList(),
              onChanged: (opt) {
                setState(() {
                  divisa = opt!;
                  obtenerData();
                });
              }),
        ),
      ],
    );
  }

  Future<void> obtenerData() async {
    final response = await http
        .get(Uri.parse('https://api.coingecko.com/api/v3/coins/bitcoin'));

    if (response.statusCode == 200) {
      setState(() {
        criptoinfo = jsonDecode(response.body)['market_data']['current_price']
                [divisa]
            .toString();
      });
    } else {
      setState(() {
        criptoinfo = 'Error al obtener la data';
      });
    }
  }
}
