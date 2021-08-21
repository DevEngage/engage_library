import 'package:earn_it/controllers/template_controller.dart';
import 'package:earn_it/models/template_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final results = useState<List>([]);
    // final currentDate = useState<DateTime>();
    // final goalCategory = useState<String>();
    final TemplateController templateController = Get.put(TemplateController());
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
          onPressed: () async {
            templateController.templateEdit = TemplateModel();
            await Navigator.pushNamed(
              context,
              '/editTemplate',
              arguments: <String, dynamic>{'id': null},
            ); // _addEditGoal(context, currentDate, goalCategory),
            // Provider.of<Goals>(context, listen: false).getList();
          }),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.5),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/imgs/space_world_medium.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black45,
                    BlendMode
                        .srcOver))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    // color: Colors.green,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.65),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(15.0))),
                    child: Center(
                      child: Text(
                        'Templates Coming Soon!',
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // GoalItem(),
          ],
        ),
      ),
    );
  }
}
