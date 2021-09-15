import 'package:get/instance_manager.dart';
import 'package:git_clone/domain/mutacion/queries/readRepositories.dart';
import 'package:git_clone/infrastructure/model/user_model.dart';
import 'package:git_clone/presentation/local.dart';
import 'package:git_clone/presentation/login/controller/login_controller.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
   LoginController login = Get.find();
  @override
  Future<List<Node>> query(int nRepositories) async {
     
    final _options = WatchQueryOptions(
      document: gql(user),
      variables: <String, dynamic>{
        'username': login.ctrlUsername.text,
        'nRepositories': nRepositories
      },
      pollInterval: const Duration(seconds: 4),
      fetchResults: true,
    );
    final result = await client.query(_options);

    if (result.hasException) {
      print(result.exception.toString());
    }
    final data = await result.data;
    final json = data!['repositoryOwner']['repositories']['nodes'] as List<dynamic>;
    final response = json.map((e) => Node.fromJson(e)).toList();
    return response;
  }
}
