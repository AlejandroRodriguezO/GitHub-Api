// To parse this JSON data, do
//
//     final repoModel = repoModelFromJson(jsonString);

import 'dart:convert';

RepoModel repoModelFromJson(String str) => RepoModel.fromJson(json.decode(str));

String repoModelToJson(RepoModel data) => json.encode(data.toJson());

class RepoModel {
    RepoModel({
        this.data,
    });

    final Data? data;

    factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.repositoryOwner,
    });

    final RepositoryOwner? repositoryOwner;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        repositoryOwner: RepositoryOwner.fromJson(json["repositoryOwner"]),
    );

    Map<String, dynamic> toJson() => {
        "repositoryOwner": repositoryOwner!.toJson(),
    };
}

class RepositoryOwner {
    RepositoryOwner({
        this.repositories,
    });

    final Repositories? repositories;

    factory RepositoryOwner.fromJson(Map<String, dynamic> json) => RepositoryOwner(
        repositories: Repositories.fromJson(json["repositories"]),
    );

    Map<String, dynamic> toJson() => {
        "repositories": repositories!.toJson(),
    };
}

class Repositories {
    Repositories({
        this.nodes,
    });

    final List<RepositoriesNode>? nodes;

    factory Repositories.fromJson(Map<String, dynamic> json) => Repositories(
        nodes: List<RepositoriesNode>.from(json["nodes"].map((x) => RepositoriesNode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes!.map((x) => x.toJson())),
    };
}

class RepositoriesNode {
    RepositoriesNode({
        this.description,
        this.createdAt,
        this.id,
        this.name,
        this.viewerHasStarred,
        this.issues,
    });

    final dynamic description;
    final DateTime? createdAt;
    final String? id;
    final String? name;
    final bool? viewerHasStarred;
    final Issues? issues;

    factory RepositoriesNode.fromJson(Map<String, dynamic> json) => RepositoriesNode(
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
        name: json["name"],
        viewerHasStarred: json["viewerHasStarred"],
        issues: Issues.fromJson(json["issues"]),
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "createdAt": createdAt!.toIso8601String(),
        "id": id,
        "name": name,
        "viewerHasStarred": viewerHasStarred,
        "issues": issues!.toJson(),
    };
}

class Issues {
    Issues({
        this.nodes,
    });

    final List<IssuesNode>? nodes;

    factory Issues.fromJson(Map<String, dynamic> json) => Issues(
        nodes: List<IssuesNode>.from(json["nodes"].map((x) => IssuesNode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes!.map((x) => x.toJson())),
    };
}

class IssuesNode {
    IssuesNode({
        this.title,
        this.state,
        this.body,
        this.author,
    });

    final String? title;
    final String? state;
    final String? body;
    final Author? author;

    factory IssuesNode.fromJson(Map<String, dynamic> json) => IssuesNode(
        title: json["title"],
        state: json["state"],
        body: json["body"],
        author: Author.fromJson(json["author"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "state": state,
        "body": body,
        "author": author!.toJson(),
    };
}

class Author {
    Author({
        this.login,
        this.avatarUrl,
    });

    final String? login;
    final String? avatarUrl;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        login: json["login"],
        avatarUrl: json["avatarUrl"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "avatarUrl": avatarUrl,
    };
}
