import 'package:flutter/material.dart';
import 'package:preferencia_de_usuario/share_prefs/preferencias_usuario.dart';

import 'package:preferencia_de_usuario/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static const String routName = 'settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;
  late String _nombre;

  late TextEditingController? _textController;

  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = TextEditingController(text: prefs.nombreUsuario);
    prefs.ultimaPagina = SettingsPage.routName;
  }

  _setSelectedRadio(int? valor) {
    // await prefs.setInt('genero', value ?? 1);
    prefs.genero = valor ?? 1;
    setState(() {
      _genero = valor ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario ? Colors.teal : Colors.blue),
        ),
        drawer: const MenuWidget(),
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.all(5.0),
              child: const Text('Settings',
                  style:
                      TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold))),
          const Divider(),
          SwitchListTile(
              value: _colorSecundario,
              title: const Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              }),
          RadioListTile(
            value: 1,
            title: const Text('Masculno'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
              value: 2,
              title: const Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          const Divider(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del usuario del celular'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ))
        ]));
  }
}
