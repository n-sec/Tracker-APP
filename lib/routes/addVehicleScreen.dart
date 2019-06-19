import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVehicleScreenState();

}

class _AddVehicleScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text('Novo veículo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text('Novo veículo'),
      ),
    );
  }

}