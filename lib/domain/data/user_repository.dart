

import 'package:git_clone/infrastructure/model/user_model.dart';

abstract class UserRepository {
   Future<List<RepositoryOwner>> query({String username});
}