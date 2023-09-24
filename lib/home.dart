// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'package:flutter/material.dart'; // Importa la biblioteca Flutter para construir interfaces de usuario.
import 'package:movieapp_20091/common/HttpHandler.dart'; // Importa la clase HttpHandler desde un archivo llamado HttpHandler.dart.

class Home extends StatefulWidget {
  const Home(
      {super.key}); // Constructor de Home con un parámetro opcional llamado key.
  @override
  State<Home> createState() =>
      _HomeState(); // Define una clase que extiende StatefulWidget y proporciona un método para crear su estado interno.
}

class _HomeState extends State<Home> {
  // Define una clase que extiende State y representa el estado interno de Home.
  @override
  void initState() {
    // Override del método initState(), que se llama cuando se crea la instancia de este widget.
    super.initState(); // Llama al initState() de la clase base (State).
    _loadJson(); // Llama a la función _loadJson() para cargar datos cuando se inicializa el widget.
  }

  _loadJson() async {
    // Define una función asincrónica para cargar datos.
    List data = await HttpHandler()
        .fetchMovies(); // Utiliza la clase HttpHandler para obtener una lista de películas de alguna fuente (por ejemplo, una API).
    print(data); // Imprime los datos cargados en la consola.
  }

  // Estilo de fuente personalizado
  final TextStyle customTextStyle = TextStyle(
    fontFamily: 'MiFuente', // Nombre de la fuente definido en pubspec.yaml
    fontSize: 16.0, // Tamaño de fuente deseado
    fontWeight: FontWeight
        .bold, // Puedes ajustar el peso de la fuente según tus preferencias
  );

  @override
  Widget build(BuildContext context) {
    // Crear una página Scaffold que contiene la estructura principal de la aplicación
    return new Scaffold(
      appBar: new AppBar(
        // Barra de navegación superior (AppBar) con un título y un botón de búsqueda
        title: new Text("MovieApp-200931"), // Título de la aplicación
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Acción a ejecutar cuando se presiona el botón de búsqueda
            },
          ),
        ],
      ),
      drawer: new Drawer(
        // Menú lateral (Drawer) que se despliega desde el borde izquierdo
        child: new ListView(children: <Widget>[
          new DrawerHeader(
              child: new Material()), // Encabezado del menú lateral

          // Elemento del menú "peliculas"
          new ListTile(
            title: new Text(
              "peliculas",
              style:
                  customTextStyle, // Aplica el estilo de fuente personalizado
            ),
            trailing: new Icon(Icons.local_movies), // Icono de películas
          ),

          // Separador en el menú
          new Divider(
            height: 5.0,
          ),

          // Elemento del menú "Television"
          new ListTile(
            title: new Text(
              "Television",
              style:
                  customTextStyle, // Aplica el estilo de fuente personalizado
            ),
            trailing: new Icon(Icons.live_tv), // Icono de televisión
          ),

          // Separador en el menú
          new Divider(
            height: 5.0,
          ),

          // Elemento del menú "Cerrar"
          new ListTile(
            title: new Text(
              "Cerrar",
              style:
                  customTextStyle, // Aplica el estilo de fuente personalizado
            ),
            trailing: new Icon(Icons.live_tv), // Icono de televisión
            onTap: () => Navigator.of(context)
                .pop(), // Cierra el menú al tocar este elemento
          ),
        ]),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        // Barra de navegación inferior (BottomNavigationBar) con iconos y etiquetas
        items: _obtenerIconos(),
      ),
    );
  }

  // Método para obtener los elementos de la barra de navegación inferior
  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.thumb_up), // Icono de pulgar hacia arriba
        label: ("populares"), // Etiqueta para la opción "populares"
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.update), // Icono de actualización
        label: ("Proximamente"), // Etiqueta para la opción "Proximamente"
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.star), // Icono de estrella
        label: ("Mejor valorados"), // Etiqueta para la opción "Mejor valorados"
      ),
    ];
  }
}
