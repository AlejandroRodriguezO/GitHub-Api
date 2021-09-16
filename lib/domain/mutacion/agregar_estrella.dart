const String agregarStar = r'''
  mutation AddStar($starrableId: ID!) {
    action: addStar(input: {starrableId: $starrableId}) {
      starrable {
        __typename
          id
        viewerHasStarred
      }
    }
  }
''';