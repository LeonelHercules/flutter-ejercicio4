import 'package:flutter/material.dart';

class operaciones2 extends StatefulWidget {
  const operaciones2({super.key});

  @override
  State<operaciones2> createState() => _operacionesState();
}

class _operacionesState extends State<operaciones2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Operaciones 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Operaciones matematicas 2',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
