// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'dart:convert'; // Importa la biblioteca para codificar y decodificar JSON.
import 'package:movieapp_20091/common/Util.dart'; // Importa la clase Media desde un archivo llamado Media.dart.

class Media {
  int id; // Identificador único del medio.
  double voteAverage; // Calificación promedio del medio.
  String title; // Título del medio.
  String posterPath; // Ruta del póster del medio.
  String backdropPath; // Ruta del fondo del medio.
  String overview; // Resumen o descripción del medio.
  String releaseDta; // Fecha de lanzamiento del medio.
  List<dynamic> genreIds; // Lista de identificadores de género del medio.

  String getPosterUrl()=> getMediumPictureUrl(posterPath);
  // Constructor de fábrica para crear una instancia de Media desde un mapa JSON.
  factory Media(Map jsonMap) {
    return new Media.deserialize(jsonMap);
    try {
      return new Media.deserialize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  // Constructor que toma un mapa JSON y asigna sus valores a las propiedades de Media.
  Media.deserialize(Map json)
      : id = json["id"]
            .toInt(), // Obtiene el valor "id" y lo convierte en un entero.
        voteAverage = json["Vote_average"]
            .toDouble(), // Obtiene el valor "Vote_average" y lo convierte en un double.
        title = json["title"], // Obtiene el valor "title".
        posterPath = json["poster_Path"] ??
            "", // Obtiene el valor "poster_Path" o establece una cadena vacía si es nulo.
        backdropPath = json["backdrop_Path"] ??
            "", // Obtiene el valor "backdrop_Path" o establece una cadena vacía si es nulo.
        overview = json["overview"], // Obtiene el valor "overview".
        releaseDta = json["release_Dta"], // Obtiene el valor "release_Dta".
        genreIds = json["genre_Ids"]
            .toList(); // Obtiene el valor "genre_Ids" como una lista dinámica.
}
