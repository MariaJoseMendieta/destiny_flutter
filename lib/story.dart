//Clase que representa una historia y sus posibles elecciones
class Story {
  String storyTitle; //Texto de la historia
  String choice1; //Texto de la primera opción
  String choice2; //Texto de la segunda opción
  //Constructor con parámetros requeridos
  Story({
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
  });
}
