import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';

class SourceResponseDto extends SourceResponseEntity {
  SourceResponseDto({
      super.status, 
      this.code, 
      this.message,
      super.sources,});

  SourceResponseDto.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(SourcesDto.fromJson(v));
      });
    }
  }
 int? code;
 String? message;

}

class SourcesDto extends SourcesEntity{
  SourcesDto({
      super.id, 
      super.name, 
      super.description, 
      super.url, 
      super.category, 
      super.language, 
      super.country,});

  SourcesDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

}