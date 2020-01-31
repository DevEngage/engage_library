
import 'package:EarnIt/widgets/goal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final results = useState<List>([]);

    void filterSearchResults(String query) async {
      List list = [];
      if (query.length < 3) {
        results.value = [];
        return;
      }
      // try {
      //   list = await ExerciseSearchModel.getState().search(query, replace: false);
      // } catch (e) {
      //   print("Exception when calling DefaultApi->analyzeARecipeSearchQuery: $e\n");
      // }
      results.value = list;
    }



    return Container(
      decoration: new BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.5),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/imgs/background.png'))), // Image.asset('assets/imgs/background.png') ),
      child: ListView(children: <Widget>[
      Container(
        color: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: TextFormField(
            onChanged: (value) => filterSearchResults(value),
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Colors.white, letterSpacing: 1.2),
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              focusColor: Colors.white,
              hintStyle:
                  Theme.of(context).textTheme.subhead.copyWith(color: Colors.white54),
              icon: Icon(
                Icons.search,
                color: Colors.greenAccent,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.text,
          ),
        )
      ),
      GoalItem(),
    ],)); // ListView.builder()
  }


}