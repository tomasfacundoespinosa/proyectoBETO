//diseñar una app que permita ingresar dos numeros y sumarlos

//sugerencia dos textfield para el ingreso, un boton para la accion, 
//decidad com mostrar el resultado, puede ser un ShowDialog
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'proyecto3',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 1, 157)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "ejercicio3"),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
//definicion de variables
    TextEditingController nombre=TextEditingController();
    List<String> lista = []; 

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
//APPBAR
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
//BODY
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //campos de texto
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 500.0),
              child: TextField(
                controller: nombre,
                decoration: const InputDecoration(
                  labelText: 'Ingrese un nombre',
                ),
                
              ),
            ),

//espacio entre los textfield y el boton            
            SizedBox(height: 40),


//boton que guarda nombre
            TextButton(
            child: Text("Guardar nombre"),
            onPressed: () {
              //int total = numero1 + numero2 + numero3 + numero4 + numero5;
              //var promedio= (total ~/ 5);
              lista.add(nombre.text);
              print(lista);

              
            },
          ),
//cierra boton que guarda nombre

//boton que muestra el texto

TextButton(
            child: Text("Mostrar nombres"),
            onPressed: () {
             // int total = numero1 + numero2 + numero3 + numero4 + numero5;
              //var promedio= (total ~/ 5);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Lista de nombres'),
                    content: 
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                     height: MediaQuery.of(context).size.height * .5,
                      child: ListView.builder(
                              itemCount: lista.length,
                              itemBuilder: (BuildContext context, int index){
                                return ListTile(
                                  title: Text(lista[index]),
                                );
                              }
                            ),
                    ),
                    actions: [
                          TextButton(onPressed: () {Navigator.pop(context);}, child: Text("OK")),
                    ],
                  );
                },
              );
            },
          ),
//cierra boton que muestra el texto


        ],
      ),
    ),
    );
}
}