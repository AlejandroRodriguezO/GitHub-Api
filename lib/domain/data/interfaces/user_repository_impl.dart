import 'package:get/get.dart';
import 'package:git_clone/domain/data/user_repository.dart';
import 'package:git_clone/domain/mutacion/queries/readRepositories.dart';
import 'package:git_clone/infrastructure/model/user_model.dart';
import 'package:git_clone/presentation/local.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<RepositoryOwner>> query({String? username}) async {
    final List<RepositoryOwner> list = [];
   try {
      final _options = WatchQueryOptions(
        document: gql(user),
        variables: <String, dynamic>{
          'username': username,
          'nRepositories': 10
        },
        pollInterval: const Duration(seconds: 4),
        fetchResults: true,
      );
      final result = await client.query(_options);

      if (result.hasException) {
        print(result.exception.toString());
      }
      final data = await result.data;
      final json = [data!['repositoryOwner']];
      print(json);
      final response = json.map((e) => RepositoryOwner.fromJson(e)).toList();
      
      Get.offAndToNamed('/home');
      return response;
   } catch (e) {
     print(e);
     return list;
   }

  }
}
