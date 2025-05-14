import 'story.dart';

class StoryBrain {
  int _storyNumber = 0; //Índice que indica la historia actual

  //Lista de objetos Story que contiene las diferentes historias
  List<Story> _storyData = [
    Story(
      storyTitle:
          'Tu auto ha pinchado una llanta en una carretera solitaria y sinuosa, en medio de la nada. No tienes señal en el celular y la oscuridad empieza a caer. Decides salir del vehículo y hacer señas. Al poco tiempo, una vieja camioneta oxidada se detiene junto a ti. Del lado del conductor, un hombre de aspecto rudo, con un sombrero de ala ancha y una mirada despiadada, abre la puerta del pasajero. Con voz grave te pregunta: ¿Necesitas que te lleve, chico?',
      choice1: 'Me subiré. ¡Gracias por la ayuda!',
      choice2: 'Será mejor primero preguntarle si es un asesino.',
    ),
    Story(
      storyTitle: 'Él asiente lentamente, sin inmutarse por la pregunta.',
      choice1: 'Al menos es honesto. Me subiré.',
      choice2: 'Espera, sé cómo cambiar una llanta.',
    ),
    Story(
      storyTitle:
          'Mientras comienzan a conducir, el desconocido empieza a hablar sobre su relación con su madre. Se pone cada vez más furioso. Te pide que abras la guantera. Dentro encuentras un cuchillo ensangrentado, dos dedos cercenados y un casete de Elton John.',
      choice1: '¡Me encanta Elton John! Le entregas el casete.',
      choice2: '¡Es él o yo! Tomas el cuchillo y lo apuñalas.',
    ),
    Story(
      storyTitle:
          'Contesta el desconocido: ¿Qué? ¡Qué decepción! ¿Sabías que los accidentes de tráfico son la segunda causa principal de muerte accidental en la mayoría de los grupos de edad adulta?',
      choice1: 'Reiniciar',
      choice2: '',
    ),
    Story(
      storyTitle:
          'Mientras atraviesas la baranda y caes hacia las rocas afiladas, reflexionas sobre la dudosa sabiduría de apuñalar a alguien que está conduciendo el auto en el que tú vas.',
      choice1: 'Reiniciar',
      choice2: '',
    ),
    Story(
      storyTitle:
          'Te haces amigo del asesino mientras cantan juntos "Can you feel the love tonight". Te deja en el próximo pueblo. Antes de irte, te pregunta si conoces algún buen lugar para deshacerse de cadáveres. Tú respondes: "Intenta en el muelle".',
      choice1: 'Reiniciar',
      choice2: '',
    ),
  ];

  //Devuelve el texto de la historia actual
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  //Devuelve el texto de la primera opción
  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  //Devuelve el texto de la segunda opción
  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  //Cambia el número de historia dependiendo de la opción seleccionada
  void nextStory(int choiceNumber) {
    if (_storyNumber == 0 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 0 && choiceNumber == 2) {
      _storyNumber = 1;
    } else if (_storyNumber == 1 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 1 && choiceNumber == 2) {
      _storyNumber = 3;
    } else if (_storyNumber == 2 && choiceNumber == 1) {
      _storyNumber = 5;
    } else if (_storyNumber == 2 && choiceNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart(); //Reinicia la historia si se ha llegado a un final
    }
  }

  //Reinicia la historia al comienzo
  void restart() {
    _storyNumber = 0;
  }

  //Determina si el segundo botón de opción debe ser visible
  bool buttonShouldBeVisible() {
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
