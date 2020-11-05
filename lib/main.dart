import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter <= 32) _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) _counter--;
    });
  }

  Text _getValue(int index) {
    if (index % 5 == 0 && index % 3 == 0)
      return Text(
        'FB',
        style: Theme.of(context).textTheme.headline6,
      );
    else if (index % 5 == 0)
      return Text(
        'Book',
        style: Theme.of(context).textTheme.headline6,
      );
    else if (index % 3 == 0)
      return Text(
        'Face',
        style: Theme.of(context).textTheme.headline6,
      );
    else
      return Text(
        '$index',
        style: Theme.of(context).textTheme.headline6,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$_counter'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.exposure_neg_1),
                  onPressed: () {
                    _decrementCounter();
                  },
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  icon: Icon(Icons.exposure_plus_1),
                  onPressed: () {
                    _incrementCounter();
                  },
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(16.0),),
            Flexible(
              child: new GridView.count(
                crossAxisCount: 6,
                children: List.generate(_counter, (index) {
                  return _getValue(index + 1);
                }),
              ),
            ),
          ],
        )
        );
  }
}
