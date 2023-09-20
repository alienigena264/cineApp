import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getMessages() {
    final messages = <String>[
      'Cargando películas',
      'Comprando palomitas',
      'Buscando butacas',
      'Preparando la sala',
      'Ajustando el proyector',
      'Encendiendo la pantalla',
      'Esto parece tardar mas de lo esperado :()'
    ];
    return Stream.periodic(const Duration(milliseconds: 1500), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Espere'),
        const SizedBox(
          height: 20,
        ),
        const CircularProgressIndicator(),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: getMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando');
              return Text(snapshot.data!);
            })
      ],
    ));
  }
}
