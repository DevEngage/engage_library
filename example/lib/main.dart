import 'package:engage_library/classes/project.dart';
import 'package:engage_library/modals/privacy_policy_modal.dart';
import 'package:engage_library/project.dart';
// import 'package:engage_library/providers/user_provider.dart';
// import 'package:engage_library/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

const String PARSE_APP_ID = '';
const String PARSE_APP_URL = '';
const String MASTER_KEY = '';
const String CLIENT_KEY = '';
const String LIVE_QUERY_URL = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Provider.debugCheckInvalidValueType = null;
  var parse = await Parse().initialize(
    PARSE_APP_ID,
    PARSE_APP_URL,
    masterKey: MASTER_KEY,
    // clientKey: CLIENT_KEY,
    // liveQueryUrl: LIVE_QUERY_URL,
    autoSendSessionId: true,
    // debug: true,
    coreStore: await CoreStoreSharedPrefsImp.getInstance(),
  );
  ParseUser user = await ParseUser.currentUser();
  // print(user);

  runApp(MyApp(user));
}

class MyApp extends StatelessWidget {
  final user;
  MyApp(
    this.user,
  );
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(create: (_) => UserProvider(user)),
        ],
        child: MaterialApp(
          //   onGenerateRoute: (RouteSettings settings) =>
          //       Router.generateRoute(settings, user, EngageProject(), []),
          initialRoute: "/",
          home: MyHomePage(),
          navigatorKey: Get.key,
          title: 'Flutter Demo',
          theme: Project.theme,
          debugShowCheckedModeBanner: false,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  final String title = 'example';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showEngagePrivacyPolicy(kitchenSink: true),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
