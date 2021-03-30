import 'package:json_serializable/builder.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

// ignore: deprecated_member_use
@JsonSerializable(nullable: false)
class Article{

  Article();

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'description')
  String desc;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'urlToImage')
  String imageUrl;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'publishedAt')
  String publishedAt;

  DateTime get getPublishedAtDate => DateTime.tryParse(publishedAt);

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}