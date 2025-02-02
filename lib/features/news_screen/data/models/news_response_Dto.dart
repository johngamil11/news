import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';

class NewsResponseDto extends NewsResponseEntity {
  NewsResponseDto({
      super.status, 
      this.code,
      this.message,
      super.totalResults, 
      super.articles,});

  NewsResponseDto.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(ArticlesDto.fromJson(v));
      });
    }
  }
  
 int? code;
 String? message;
}

class ArticlesDto extends ArticlesEntity{
  ArticlesDto({
      super.source, 
      super.author, 
      super.title, 
      super.description, 
      super.url, 
      super.urlToImage, 
      super.publishedAt, 
      super.content,});

  ArticlesDto.fromJson(dynamic json) {
    source = json['source'] != null ? SourceDto.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }


}

class SourceDto extends SourceEntity {
  SourceDto({
      super.id, 
      super.name,});

  SourceDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

}