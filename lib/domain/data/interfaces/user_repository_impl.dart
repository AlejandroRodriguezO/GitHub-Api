import 'package:git_clone/domain/data/user_repository.dart';
import 'package:git_clone/domain/mutacion/queries/readRepositories.dart';
import 'package:git_clone/infrastructure/model/user_model.dart';
import 'package:git_clone/presentation/local.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<Viewer>> query() async {
    final _options = WatchQueryOptions(
      document: gql(user),
      pollInterval: const Duration(seconds: 4),
      fetchResults: true,
    );
    final result = await client.query(_options);

    if (result.hasException) {
      print(result.exception.toString());
    }
    final data = await result.data;
    final json = [data!['viewer']];
    final response = json.map((e) => Viewer.fromJson(e)).toList();
    return response;
  }
}
