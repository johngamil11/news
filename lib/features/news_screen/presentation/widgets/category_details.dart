import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/color_manager.dart';
import 'package:news/features/news_screen/presentation/blocs/cubit/articales_cubit.dart';
import 'package:news/features/news_screen/presentation/blocs/cubit/sources_cubit.dart';
import 'package:news/features/news_screen/presentation/pages/articales_details.dart';
import 'package:news/features/news_screen/presentation/widgets/articale__view.dart';
import 'package:news/features/news_screen/presentation/widgets/category_model.dart';

class CategoryDetails extends StatelessWidget {
    var categoriesList = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return    Container(
            child: Column(
              children: [
                Container(
                  height: 60,
                  child: BlocBuilder<SourcesCubit, SourcesState>(
                    builder: (context, state) {
                      if(state is SourcesLoading){
                        return Center(child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),);
                      }
                      if (state is SourcesLoaded) {
                        if (state.sources != null && state.sources!.isNotEmpty) {
                          String selectedSource = state.sources![0].id.toString();
                          BlocProvider.of<ArticalesCubit>(context).getArticles(selectedSource);
                        }

                        return DefaultTabController(
                          length: state.sources!.length,
                          child: Column(
                            children: [
                              TabBar(
                                onTap: (index) {
                                  
                                  var selectedSource = state.sources![index].id.toString();
                                  BlocProvider.of<SourcesCubit>(context).changeTab(index);
                                  BlocProvider.of<ArticalesCubit>(context).getArticles(selectedSource);
                                },
                                isScrollable: true,
                                indicatorColor: Colors.transparent,
                                dividerColor: Colors.transparent,
                                tabs: List.generate(state.sources!.length, (index) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      int selectedIndex = DefaultTabController.of(context).index;
                                      bool isSelected = index == selectedIndex;
                                      return Container(
                                        height: 45,
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: isSelected ? ColorManager.primary : Colors.transparent,
                                          border: Border.all(color: ColorManager.primary , width: 2),
                                        ),
                                        child:
                                        Center(child: Text(state.sources![index].name ?? '' , style: TextStyle(
                                          color: isSelected ? ColorManager.white : ColorManager.primary,
                                          fontWeight: FontWeight.bold
                                        ),),)
                                      );
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                
                Expanded(
                  child: BlocBuilder<ArticalesCubit, ArticalesState>(
                    builder: (context, state) {
                      if(state is ArticalesLoading){
                        return Center(child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),);
                      }
                      if (state is ArticalesLoaded) {
                        return ListView.builder(
                          itemCount: state.articles!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                               InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ArticalesDetails(
                                      titleId:
                                      state.articles![index].source!.name ??'' , 
                                      // categoriesList[index].title
                                      imageUrl: state.articles![index].urlToImage ??'' ,
                                        author:state.articles![index].author??'' ,
                                  title:state.articles![index].title ??'' ,
                                  time: state.articles![index].publishedAt ??'',
                                  content: state.articles![index].content ??'',
                                  description: state.articles![index].description ??'',
                                  link: state.articles![index].url ??'',
                                      )));
                                },
                                 child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: 360.w,
                                                               
                                  height: 320.h,
                                  decoration: BoxDecoration(
                                    
                                  borderRadius: BorderRadius.circular(25),
                                                               
                                  ),
                                  child: ArticaleView(imageUrl: state.articles![index].urlToImage ??'' ,
                                  auther:state.articles![index].author ??'' ,
                                  title:state.articles![index].title ??'' ,
                                  publishedAt: state.articles![index].publishedAt ??'',
                                  )
                                 ),
                               ),
                              ],
                            );
                    
                          },
                        );
                      } else {
                        return Center(child: Text('No Articles Available'));
                      }
                    },
                  ),
                ),
              ],
            ),
          );
  }
}