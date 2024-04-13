import 'package:aplikasi_provider_multi/provider/counter.dart';
import 'package:aplikasi_provider_multi/provider/warna.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          // masih 1 provider
          ChangeNotifierProvider(create: (context) => Counter(),),
          // 2 provider
          ChangeNotifierProvider(create: (context) => Warna(),)
        ],
        child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    Warna warna = Provider.of<Warna>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiProvider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: warna.warnaValue(counter.counterValue),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  counter.decrement();
                }, child: Text("-")),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(counter.counterValue.toString(), style: TextStyle(fontSize: 30),),
                ),
                ElevatedButton(onPressed: (){
                  counter.increment();
                }, child: Text("+")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
