class SourceResponseEntity {
  SourceResponseEntity({
      this.status, 
      this.sources,});

  String? status;
  List<SourcesEntity>? sources;

}

class SourcesEntity {
  SourcesEntity({
      this.id, 
      this.name, 
      this.description, 
      this.url, 
      this.category, 
      this.language, 
      this.country,});

  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

}