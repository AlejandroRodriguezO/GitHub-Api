

const String user = r'''
query {
  viewer {
    avatarUrl
    bio
    createdAt
    email
    login
    location
  }
}
''';

const String createRepositories = r'''
mutation create($name: String!, $descripcion: String!) {
  createRepository(input: {name: $name, visibility: PUBLIC, description: $descripcion}) {
    clientMutationId
    repository {
      id
      nameWithOwner
    }
  }
}
''';
const String createIssues= r'''
mutation issue($name: String!, $id: ID!, $desc: String!) {
  createIssue(input: {repositoryId: $id, title: $name, body: $desc}) {
    clientMutationId
  }
}

''';
const String respositories = r'''
query repositories($username: String!, $nRepositories: Int!) {
  repositoryOwner(login: $username) {
    repositories(orderBy: {field: CREATED_AT, direction: ASC}, first: $nRepositories) {
      nodes {
        description
        createdAt
        id
        name
        viewerHasStarred
        issues(first: 100) {
          nodes {
            title
            state
            body
            author {
              login
              avatarUrl
            }
          }
        }
      }
    }
  }
}
''';
