import 'package:destiny/story_brain.dart';
import 'package:flutter/material.dart';

// Creamos un objeto de la clase StoryBrain, que contiene la lista de preguntas y las funciones para avanzar, reiniciar y verificar la opción elegida
StoryBrain storyBrain = StoryBrain();

void main() {
  runApp(const MyApp());
}

//Define la estructura principal de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StoryPage());
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

// Esta clase guarda y actualiza el estado de la app: controla qué historia se muestra y verifica respuestas
class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints:
            BoxConstraints.expand(), //Expande al máximo posible (horizontal y vertical)
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover, //Permite que la imagen cubra toda la pantalla
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain
                        .getStory(), //Obtiene y muestra el texto de la historia actual
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 21.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(
                        1,
                      ); //Avanza la historia con la opción 1
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFBCAAA4),
                  ),
                  child: Text(
                    storyBrain
                        .getChoice1(), //Muestra el texto de la primera opción
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible:
                      storyBrain
                          .buttonShouldBeVisible(), //Oculta el botón si solo hay una opción
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(
                          2,
                        ); //Avanza la historia con la opción 2
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFA1887F),
                    ),
                    child: Text(
                      storyBrain
                          .getChoice2(), //Muestra el texto de la segunda opción
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
