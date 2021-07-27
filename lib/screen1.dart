import 'package:cinco_contatos/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  final context;
  const Screen1({Key? key, this.context}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State(context);
}

class _Screen1State extends State<Screen1> {
  _Screen1State(context);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: context.read<Counter>().increment,
            child: Observer(
                builder: (context) => Text("${context.watch<Counter>().value}",
                    style: Theme.of(context).textTheme.headline4))),
        ElevatedButton(
            onPressed: context.read<Counter>().reset,
            child: Text("reset", style: TextStyle(fontSize: 20)))
      ],
    );
  }
}
