import 'package:flutter/material.dart';
import 'package:news/core/utils/color_manager.dart';

class CategoryModel {
String id ;
String title ; 
String imagePath ;
Color color ;  
//- entertainment- general----technology //todo: change icons ui 
CategoryModel ({ required this.id , required this.title , required this.imagePath , required this.color });

static List<CategoryModel> getCategories() {
  return [
CategoryModel(title: 'Sport' , id: 'sports',
 imagePath: 'assets/images/sport.gif' , color:ColorManager.red ),

CategoryModel(title: 'General' , id: 'general',
 imagePath: 'assets/images/general.gif' , color:ColorManager.yellow ),
  //x
CategoryModel(title: 'Health' , id: 'health',
 imagePath: 'assets/images/health.gif' , color:ColorManager.pink ),

CategoryModel(title: 'Business' , id: 'business',
 imagePath: 'assets/images/bussiness.gif' , color:ColorManager.beige ),

CategoryModel(title: 'Entertainment' , id: 'entertainment',
 imagePath: 'assets/images/entertainment.gif' , color:ColorManager.babyBlue  ),
 //x
CategoryModel(title: 'Science' , id: 'science',
 imagePath: 'assets/images/science.gif' , color:const Color.fromARGB(255, 0, 255, 170) ),
CategoryModel(title: 'Technology' , id: 'technology',
 imagePath: 'assets/images/technology.gif' , color:ColorManager.blue ),
  ];
}

}