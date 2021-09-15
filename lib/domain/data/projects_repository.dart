import 'package:git_clone/infrastructure/model/user_model.dart';

abstract class ProjectsRepository {
  Future<List<Node>> query(int nRepositories);
}