import 'package:flutter/material.dart';
import 'package:preferencia_de_usuario/share_prefs/preferencias_usuario.dart';
import 'package:preferencia_de_usuario/src/pages/home_page.dart';
import 'package:preferencia_de_usuario/src/pages/settings_page.dart';

void main() async {

	WidgetsFlutterBinding.ensureInitialized();

	final prefs = PreferenciasUsuario();
	await prefs.initPrefs();

	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
	final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowMaterialGrid: false,
      title: 'Preferencias de usuario',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routName : (BuildContext context) => HomePage(),
				SettingsPage.routName : (BuildContext context) => const SettingsPage(),
      }
    );
  }
}