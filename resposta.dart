import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  const Resposta(this.texto, this.onSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.tryParse('200.20'),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
        ),
        onPressed: onSelected,
        child: Text(texto),
      ),
    );
  }
}
