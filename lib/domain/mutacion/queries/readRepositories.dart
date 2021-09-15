

const String user = r'''
query ReadRepositories($username: String!, $nRepositories: Int!) {
  repositoryOwner(login: $username) {
    ... on User {
      id
      email
      name
      avatarUrl
      bio
    }
    repositories(first: $nRepositories) {
      nodes {
        id
        name
        viewerHasStarred
      }
      totalCount
    }
  }
}
''';