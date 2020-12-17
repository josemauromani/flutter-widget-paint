import 'package:desenho/widget-paint.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<dynamic, dynamic>> posicoes;

  @override
  void initState() {
    super.initState();
    posicoes = [];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: GestureDetector(
              child: CustomPaint(
                willChange: true,
                painter: WidgetPainter(
                  points: posicoes,
                ),
              ),
              onTapDown: (details) {
                var posicao = {
                  'x': details.globalPosition.dx,
                  'y': details.globalPosition.dy
                };
                setState(() {
                  posicoes.add(posicao);
                });
              },
            ),
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
          ),
          Text(posicoes.toString()),
        ],
      ),
    );
  }
}
