import 'package:EarnIt/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'dialogs/goal_edit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EarnIt',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/editGoals': (context) => GoalEdit(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
  final List<Widget> _children = [
   HomeScreen(),
   Text('test 2'),
   Text('test 3'),
 ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
    //  appBar: AppBar(
    //    title: Container(
    //       color: Colors.black38,
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //             child: TextFormField(
    //               onChanged: (value) => filterSearchResults(value),
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .title
    //                   .copyWith(color: Colors.white, letterSpacing: 1.2),
    //               decoration: new InputDecoration(
    //                 border: InputBorder.none,
    //                 hintText: "Ran 30 mins",
    //                 focusColor: AppTheme.white,
    //                 hintStyle:
    //                     Theme.of(context).textTheme.subhead.copyWith(color: AppTheme.figmaGray),
    //                 icon: Icon(
    //                   Icons.search,
    //                   color: AppTheme.figmaGreen,
    //                 ),
    //                 contentPadding: EdgeInsets.zero,
    //               ),
    //               keyboardType: TextInputType.text,
    //             ),
    //           )
    //         ),
    //  ),
     body: _children[_currentIndex], // new
    //  floatingActionButton: _currentIndex == 0 ? FloatingActionButton(
    //    backgroundColor: Colors.deepPurple, 
    //    child: Icon(Icons.add), 
    //    onPressed: () => true,
    //  ) : null,
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('Goals'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.people),
           title: Text('World'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     ),
   );
  }
}
