import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobx/app/models/item_model.dart';
import 'components/item_widget.dart';
import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    final controller = HomeController();

    _dialog() {

        var model = ItemModel();

        showDialog(
        context: context, 
        builder: (_) {
            return AlertDialog(
            title: Text('Adicionar item'),
            content: TextField(
                onChanged: model.setTitle,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Novo Item',
                ),
            ),
            actions: <Widget>[
                TextButton(
                onPressed: () {
                    controller.addItem(model);
                    Navigator.pop(context);
                }, 
                child: Text('Salvar'),
                ),
                TextButton(
                onPressed: () {
                    Navigator.pop(context);
                }, 
                child: Text('Cancelar'),
                ),
            ],
            );
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: TextField(
                    decoration: InputDecoration(hintText: "Pesquisa..."),
                ),
                actions: <Widget>[
                    IconButton(
                        onPressed: () {}, 
                        icon: Observer(builder: (_) {
                            return Text("${controller.totalChecked}");
                        }),
                    )
                ],
            ),
            body: Observer(builder: (_) {
                return ListView.builder(
                    itemCount: controller.listItems.length,
                    itemBuilder: (_, index) {
                        var item = controller.listItems[index];
                        return ItemWidget(item: item, removeClicked: (){
                            controller.removeItem(item);
                        });
                    },
                );
            }),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                    _dialog();
                },
            ),
        );
    }
}