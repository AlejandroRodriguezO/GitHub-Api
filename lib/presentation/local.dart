import 'package:git_clone/infrastructure/model/repo_model.dart';
import 'package:git_clone/infrastructure/model/user_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String ACCESS_TOKEN = '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';

late List<Viewer> userData;
List<RepositoriesNode> projectsData = [];

final HttpLink httpLink = HttpLink(
  'https://api.github.com/graphql',
);

final AuthLink authLink = AuthLink(
  getToken: () async => 'Bearer $ACCESS_TOKEN',
);

final Link link = authLink.concat(httpLink);

final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(),
  link: link,
);
