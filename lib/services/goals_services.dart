
import 'package:earn_it/models/goal_model.dart';
import 'package:engagefire/mobile.dart';

class GoalsService extends EngageService<GoalModal> {
  GoalsService(): super(
    name: 'goals',
    path: 'goals',
  );

  Future<List<GoalModal>> getGoals() {
    return getItems();
  }

}