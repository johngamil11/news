class NewsResponseEntity {
  NewsResponseEntity({
      this.status, 
      this.totalResults, 
      this.articles,});

  String? status;
  num? totalResults;
  List<ArticlesEntity>? articles;


}

class ArticlesEntity {
  ArticlesEntity({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  SourceEntity? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;


}

class SourceEntity {
  SourceEntity({
      this.id, 
      this.name,});

  String? id;
  String? name;

}