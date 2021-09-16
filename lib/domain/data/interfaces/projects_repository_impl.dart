import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/domain/mutacion/agregar_estrella.dart';
import 'package:git_clone/domain/mutacion/eliminar_estrella.dart';
import 'package:git_clone/domain/mutacion/queries/readRepositories.dart';
import 'package:git_clone/infrastructure/model/repo_model.dart';
import 'package:git_clone/presentation/local.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  @override
  Future<List<RepositoriesNode>> query(int nRepositories) async {
    final _options = WatchQueryOptions(
      document: gql(respositories),
      variables: <String, dynamic>{
        'username': 'alejandro9415',
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
    final json =
        data!['repositoryOwner']['repositories']['nodes'] as List<dynamic>;
    final response = json.map((e) => RepositoriesNode.fromJson(e)).toList();
    return response;
  }

  @override
  Future<void> createRepository(String name, String descripcion) async {
    final _options = await MutationOptions(
      document: gql(createRepositories),
      variables: {
        'name': name,
        'descripcion': descripcion,
      },
      onError: (OperationException? error) => Get.dialog(AlertDialog(
        title: Text('Huvo un error'),
        content: Text(
          error.toString(),
        ),
      )),
      onCompleted: (dynamic resultData) => Get.dialog(
        AlertDialog(
          title: Text('Repositorio Creado'),
          content: Text(
            'Excelente',
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('ok'),
            )
          ],
        ),
      ),
    );
    final result = await client.mutate(_options);
    print(result.data);
  }

  @override
  Future<void> createIssue(String name, String desc, String id) async {
   
    final _options = await MutationOptions(
      document: gql(createIssues),
      variables: {
        'name': name,
        'desc': desc,
        'id': id,
      },
      onError: (OperationException? error) => Get.dialog(AlertDialog(
        title: Text('Huvo un error'),
        content: Text(
          error.toString(),
        ),
      )),
      onCompleted: (dynamic resultData) => Get.dialog(
        AlertDialog(
          title: Text('Issue Creado'),
          content: Text(
            'Excelente',
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('ok'),
            )
          ],
        ),
      ),
    );
    final result = await client.mutate(_options);
  }

  @override
  Future<void> addStar(String id) async{
    
    final _options = await MutationOptions(
      document: gql(agregarStar),
      variables: {
        'starrableId': id,
      },
      onError: (OperationException? error) => Get.dialog(AlertDialog(
        title: Text('Huvo un error'),
        content: Text(
          error.toString(),
        ),
      )),
    );
    final result = await client.mutate(_options);
    print(result.data);
  
  }

  @override
  Future<void> deleteStar(String id) async{
    final _options = await MutationOptions(
      document: gql(removeStar),
      variables: {
        'starrableId': id,
      },
      onError: (OperationException? error) => Get.dialog(AlertDialog(
        title: Text('Huvo un error'),
        content: Text(
          error.toString(),
        ),
      )),
    );
    final result = await client.mutate(_options);
    print(result.data);
  }
}
