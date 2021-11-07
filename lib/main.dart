import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_example/providers/fruit_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => FruitProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
            color: Colors.white,
            child: Center(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: context.watch<FruitProvider>().count,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'images/apple.png',
                      width: 100,
                      height: 100,
                    );
                  }),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                key: Key('decrement_floatingActionButton'),
                onPressed: () => context.read<FruitProvider>().decrement(),
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              SizedBox(
                width: 10.0,
              ),
              FloatingActionButton(
                key: Key('reset_floatingActionButton'),
                onPressed: () => context.read<FruitProvider>().reset(),
                tooltip: 'Reset',
                child: Icon(Icons.exposure_zero),
              ),
              SizedBox(
                width: 10.0,
              ),
              FloatingActionButton(
                key: Key('increment_floatingActionButton'),
                onPressed: () => context.read<FruitProvider>().increment(),
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ],
          )),
    );
  }
}
