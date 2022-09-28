import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        'Preto',
        'Roxo',
        'Vermelho',
        'Azul',
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        'Elefante',
        'Leão',
        'Touro',
        'Coelho',
      ],
    },
    {
      'texto': 'Qual é o sua comida favorita?',
      'respostas': [
        'Lasanha',
        'Parmegiana',
        'Churrasco',
        'Sushi',
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];

    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: const Text('Quero te conhecer!'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: temPerguntaSelecionada
          ? Column(
              children: <Widget>[
                Questao(_perguntas[_perguntaSelecionada]['texto'] as String),
                ...respostas.map((t) => Resposta(t, _responder)).toList(),
              ],
            )
          : const Resultado(),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
