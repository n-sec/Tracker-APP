import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_word/GoogleMaps.dart';
import 'package:hello_word/classes/vehicle.dart';
import 'package:hello_word/routes/addVehicleScreen.dart';
import 'package:hello_word/routes/localizationScreen.dart';
import 'package:permission/permission.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  bool _onMap = true;

  var requestPermissions = Permission.requestPermissions([
    PermissionName.Location,
  ]);

  @override
  Widget build(BuildContext context) {
    bool darkMode = Theme.of(context).brightness == Brightness.dark;

    requestPermissions.then((res) {
      print(res[0].permissionStatus);
    });

    List<VehicleCard> _vehicle = <VehicleCard>[
      VehicleCard(
        Vehicle(
          id: '1234567890',
          name: 'PIV-1568',
          manufacture: 'Honda',
          model: 'CG 160 Fan',
        ),
      ),
      VehicleCard(
        Vehicle(
          id: '1234567891',
          name: 'PIP-9123',
          manufacture: 'Honda',
          model: 'CG 160 Start',
        ),
      ),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nova Security'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.map),
              ),
            ],
          ),
        ),
        
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            ListView(
              padding: EdgeInsets.all(5),
              children: _vehicle,
            ),
            GoogleMaps(),
          ],
        ),
        floatingActionButton: Visibility(
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              /*
                setState(() {
                  _onMap = false;
                });
              */
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddVehicleScreen()));
            },
          ),
          visible: _onMap,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: FlutterLogo(),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                accountName: Text('Gerson Víctor'),
                accountEmail: Text('gerson.vfs@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Início'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Pagamentos'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              SwitchListTile(
                secondary: Icon(Icons.brightness_medium),
                title: Text('Modo escuro'),
                value: darkMode,
                onChanged: (bool newValue) {
                  if (newValue) {
                    DynamicTheme.of(context).setBrightness(Brightness.dark);
                  } else {
                    DynamicTheme.of(context).setBrightness(Brightness.light);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
                onTap: () {
                  // Update the state of the app
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.more),
                title: Text('Sobre o aplicativo'),
                onTap: () {
                  // Update the state of the app
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.comment),
                title: Text('Notas do desenvolvedor'),
                onTap: () {
                  // Update the state of the app
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  VehicleCard(this.vehicle);

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.all(5),
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  right: 10
                ),
                child: CircleAvatar(
                  child: FlutterLogo(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    vehicle.name,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text('${vehicle.manufacture} ${vehicle.model}'),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Editar'),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(Icons.delete_forever),
                            title: Text('Excluir'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.lock),
                      Text('Bloquear'),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.lock_open),
                      Text('Desbloquear'),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.my_location),
                      Text('Localizar'),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LocalizationScreen(
                      target: LatLng(45.521563, -122.677433),
                    )));
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.devices),
                      Text('Comandos'),
                    ],
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ListView(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.volume_up),
                            title: Text('Ativar alarme'),
                          ),
                          ListTile(
                            leading: Icon(Icons.volume_off),
                            title: Text('Desativar alarme'),
                          ),
                          ListTile(
                            leading: Icon(Icons.lock),
                            title: Text('Bloquear veículo'),
                          ),
                          ListTile(
                            leading: Icon(Icons.lock_open),
                            title: Text('Desbloquear veículo'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}