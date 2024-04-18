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
      debugShowCheckedModeBanner: false,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "ejercicio2"),
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
    int numero1=0;
    int numero2=0;
    int numero3=0;
    int numero4=0;
    int numero5=0;

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
                onChanged: (value) => numero1 = int.tryParse(value) ?? 0,
                decoration: const InputDecoration(
                  labelText: 'Ingrese el primer número',
                ),
                
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 500.0),
              child: TextField(
                onChanged: (value) => numero2 = int.tryParse(value) ?? 0,
                decoration: const InputDecoration(
                  labelText: 'Ingrese el segundo número',
                ),
                
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 500.0),
              child: TextField(
                onChanged: (value) => numero3 = int.tryParse(value) ?? 0,
                decoration: const InputDecoration(
                  labelText: 'Ingrese el tercer número',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 500.0),
              child: TextField(
                onChanged: (value) => numero4 = int.tryParse(value) ?? 0,
                decoration: const InputDecoration(
                  labelText: 'Ingrese el cuarto número',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 500.0),
              child: TextField(
                onChanged: (value) => numero5 = int.tryParse(value) ?? 0,
                decoration: const InputDecoration(
                  labelText: 'Ingrese el quinto número',
                ),
              ),
            ),



//espacio entre los textfield y el boton            
            SizedBox(height: 40),
//boton
            TextButton(
            child: Text("Sacar promedio"),
            onPressed: () {
              int total = numero1 + numero2 + numero3 + numero4 + numero5;
              var promedio= (total ~/ 5);
              
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Sacar promedio'),
                    content: Text('El promedio es: $promedio'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
    );
}
}