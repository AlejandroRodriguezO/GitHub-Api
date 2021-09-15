
import 'package:git_clone/infrastructure/model/user_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String ACCESS_TOKEN = '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';

 List<RepositoryOwner> userData = [];
 List<Node> projectsData = [];

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