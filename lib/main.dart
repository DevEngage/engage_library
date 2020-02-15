// import 'package:EarnIt/models/goal.dart';
import 'package:EarnIt/providers/goal_provider.dart';
import 'package:EarnIt/screens/goal_screen.dart';
import 'package:EarnIt/screens/home_screen.dart';
import 'package:EarnIt/screens/login_screen.dart';
import 'package:EarnIt/screens/profile_screen.dart';
import 'package:EarnIt/screens/task_edit_screens.dart';
import 'package:EarnIt/screens/world_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/goal_edit_screens.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

const String PARSE_APP_ID = 'hMsZzKYCmFZCGawSC1lx1onLIbeTT88dYBUFFGTa';
const String PARSE_APP_URL = 'https://parseapi.back4app.com';
const String MASTER_KEY = '1Sxm6pOWOESxt9UoSXAta7l9AyYcY3IPSyUiOra2';
const String CLIENT_KEY = 'UN76vqVKNMPmpkD4DjOleR7tNHdnwMmhiHHdBCei';
const String LIVE_QUERY_URL = 'wss://trongdth.back4app.io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Provider.debugCheckInvalidValueType = null;
  try {
    await Parse().initialize(
      PARSE_APP_ID,
      PARSE_APP_URL,
      masterKey: MASTER_KEY,
      // clientKey: CLIENT_KEY,
      // liveQueryUrl: LIVE_QUERY_URL,
      autoSendSessionId: true,
      debug: true,
      coreStore: await CoreStoreSharedPrefsImp.getInstance(),
    );
    // print(parse.hasParseBeenInitialized());
  } catch (error) {
    print(error);
  }

  ParseUser user = await ParseUser.currentUser();
  // print(user);

  print(await (ParseObject('Goal')).getAll());

  runApp(MyApp(user));
}

class MyApp extends StatelessWidget {
  final user;
  MyApp(
    this.user,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Goals()),
        ],
        child: MaterialApp(
            title: 'EarnIt',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            routes: {
              '/': (context) => user == null ? LoginScreen() : MyHomePage(),
              '/home': (context) => MyHomePage(),
              '/login': (context) => LoginScreen(),
              '/editGoals': (context) => GoalEdit(),
              '/viewGoal': (context) => GoalScreen(),
              '/editTask': (context) => TaskEdit(),
            }));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    WorldScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Goals'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.content_copy),
            title: Text('Templates'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}
