import 'package:flutter/cupertino.dart';
import 'package:git_clone/infrastructure/model/repo_model.dart';

abstract class ProjectsRepository {
  Future<List<RepositoriesNode>> query(int nRepositories);
  Future<void> createRepository(String name, String descripcion);
  Future<void> createIssue(String name, String desc, String id);
  Future<void> addStar(String id);
  Future<void> deleteStar(String id);
}