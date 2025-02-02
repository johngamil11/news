import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/color_manager.dart';
import 'package:news/features/news_screen/presentation/blocs/cubit/articales_cubit.dart';
import 'package:news/features/news_screen/presentation/blocs/cubit/sources_cubit.dart';
import 'package:news/features/news_screen/presentation/drawer/home_drawer.dart';
import 'package:news/features/news_screen/presentation/pages/category/category_fragment.dart';
import 'package:news/features/news_screen/presentation/widgets/articale__view.dart';
import 'package:news/features/news_screen/presentation/widgets/category_details.dart';
import 'package:news/features/news_screen/presentation/widgets/category_model.dart';

class NewsScreen extends StatelessWidget {
  // NewsScreen({});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SourcesCubit>(context).loadData;

    return Stack(
      children:[
        Container(
           color: ColorManager.white,
          child: Image.asset(
              'assets/images/background.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
        ),
         Scaffold(
          backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          title: Text('News'),
          titleTextStyle: TextStyle(color: ColorManager.white, fontSize: 35),
          centerTitle: true,
          toolbarHeight: 70.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
        ),
        drawer: Drawer(
          backgroundColor: ColorManager.white,
          
          child: HomeDrawer(onSideFunctionClick:
      BlocProvider.of<SourcesCubit>(context).onSideFunctionClick)
    
         //  onSideFunctionClick
        ),
        body: 
              // CategoryDetails() ,
            BlocBuilder<SourcesCubit, SourcesState>(
  builder: (context, state) {
    if (state is SourcesLoading) {
      return Center(child: CircularProgressIndicator(color: ColorManager.primary,));
    }

    return BlocProvider.of<SourcesCubit>(context).selectedCategory == null
        ? CategoryFragment(
            onCategoryItemClick: (CategoryModel category) {
              BlocProvider.of<SourcesCubit>(context).onCategoryItemClick(category);
            },
          )
        : CategoryDetails();
  },
),
          
      
          ),
    ]);
  }

  

}
