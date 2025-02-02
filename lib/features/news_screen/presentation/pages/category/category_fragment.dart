import 'package:flutter/material.dart';
import 'package:news/core/utils/color_manager.dart';
import 'package:news/features/news_screen/presentation/pages/category/CategoryItem.dart';
import 'package:news/features/news_screen/presentation/widgets/category_model.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryModel.getCategories();
  Function onCategoryItemClick ; 
  CategoryFragment({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category \nof interest',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: ColorManager.darkGrey, fontSize: 22),
          ),
         
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , 
              mainAxisSpacing: 10 , 
              crossAxisSpacing: 10),
             itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                  onCategoryItemClick(categoriesList[index]);

                },
                child: CategoryItem(categoryModel: categoriesList[index],index: index,));
             },
             
             itemCount: categoriesList.length,
             
             ),
          )
         
        ],
      ),
    );
  }
}