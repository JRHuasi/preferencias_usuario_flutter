import 'package:flutter/material.dart';
import 'package:preferencia_de_usuario/share_prefs/preferencias_usuario.dart';
import 'package:preferencia_de_usuario/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const String routName = 'home';
	final prefs = PreferenciasUsuario();	

  @override
  Widget build(BuildContext context) {
		prefs.ultimaPagina = HomePage.routName;
    return SafeArea(
      child: Scaffold(
				appBar: AppBar(
					title: Text('Preferencias de Usuario'),
					backgroundColor: (prefs.colorSecundario ? Colors.teal : Colors.blue),
				),
				drawer: MenuWidget(),
				body: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Text('Color secundario: ${prefs.colorSecundario}'),
						Divider(),
						Text('Género: ${prefs.genero}'),
						Divider(),
						Text('Nombre Usuario: ${prefs.nombreUsuario}'),
						Divider(),
					]
				)
			),
    );
  }
}

