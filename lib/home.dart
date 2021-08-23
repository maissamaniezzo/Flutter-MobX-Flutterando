import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobx/body.dart';
import 'package:fluttermobx/controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    

    @override
    Widget build(BuildContext context) {
        final controller = Provider.of<Controller>(context); 

        return Scaffold(
            appBar: AppBar(
            title: Observer(
                builder: (_) {
                    return Text(controller.isValid ? 'Formulário Validado' : 'Formulário Não Validado');
                },
            ),
            ),
            body: BodyWidget(),
        );
    }
}