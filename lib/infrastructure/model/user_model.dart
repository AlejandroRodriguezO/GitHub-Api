// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    Data({
        this.data,
    });

    final DataClass? data;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: DataClass.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
    };
}

class DataClass {
    DataClass({
        this.repositoryOwner,
    });

    final RepositoryOwner? repositoryOwner;

    factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
        repositoryOwner: RepositoryOwner.fromJson(json["repositoryOwner"]),
    );

    Map<String, dynamic> toJson() => {
        "repositoryOwner": repositoryOwner!.toJson(),
    };
}

class RepositoryOwner {
    RepositoryOwner({
        this.id,
        this.email,
        this.name,
        this.avatarUrl,
        this.bio,
        this.repositories,
    });

    final String? id;
    final String? email;
    final String? name;
    final String? avatarUrl;
    final String? bio;
    final Repositories? repositories;

    factory RepositoryOwner.fromJson(Map<String, dynamic> json) => RepositoryOwner(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        avatarUrl: json["avatarUrl"],
        bio: json["bio"],
        repositories: Repositories.fromJson(json["repositories"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "avatarUrl": avatarUrl,
        "bio": bio,
        "repositories": repositories!.toJson(),
    };
}

class Repositories {
    Repositories({
        this.nodes,
        this.totalCount,
    });

    final List<Node>? nodes;
    final int? totalCount;

    factory Repositories.fromJson(Map<String, dynamic> json) => Repositories(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
        totalCount: json["totalCount"],
    );

    Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes!.map((x) => x.toJson())),
        "totalCount": totalCount,
    };
}

class Node {
    Node({
        this.id,
        this.name,
        this.viewerHasStarred,
    });

    final String? id;
    final String? name;
    final bool? viewerHasStarred;

    factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        name: json["name"],
        viewerHasStarred: json["viewerHasStarred"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "viewerHasStarred": viewerHasStarred,
    };
}
