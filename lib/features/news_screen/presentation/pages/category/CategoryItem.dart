import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/color_manager.dart';
import 'package:news/features/news_screen/presentation/widgets/category_model.dart';

class CategoryItem extends StatelessWidget {
CategoryModel categoryModel  ; 
int index ;
CategoryItem({required this.categoryModel , required this.index});
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(index % 2 != 0 ? 25 : 0),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              categoryModel.imagePath,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ColorManager.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
  }
