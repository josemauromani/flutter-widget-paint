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
                  'x': details.localPosition.dx,
                  'y': details.localPosition.dy
                };
                setState(() {
                  posicoes.add(posicao);
                });
              },
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.save),
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          iconSize: 40,
                          onPressed: () {
                            print('salvar');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Salvar'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
