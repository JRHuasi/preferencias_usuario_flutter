import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // no se usa estas propiedades
  // bool? _colorSecundarion;
  // int? _genero;
  // String? _nombre;

  // GET y SET  del género
  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

	set genero(int value) {
		_prefs.setInt('genero', value); 
	}

	// GET y SET  del _colorSecundarion
  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

	set colorSecundario(bool value) {
		_prefs.setBool('colorSecundario', value); 
	}

		// GET y SET  del nombre de usuario
  String get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

	set nombreUsuario(String value) {
		_prefs.setString('nombreUsuario', value);
	}

		// GET y SET  del última página
  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

	set ultimaPagina(String value) {
		_prefs.setString('ultimaPagina', value);
	}
}
