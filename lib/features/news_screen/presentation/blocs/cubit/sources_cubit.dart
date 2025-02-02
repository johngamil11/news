import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';
import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';
import 'package:news/features/news_screen/domain/use_cases/news_use_case.dart';
import 'package:news/features/news_screen/presentation/drawer/home_drawer.dart';
import 'package:news/features/news_screen/presentation/widgets/category_model.dart';

part 'sources_state.dart';

class SourcesCubit extends Cubit<SourcesState> {
  final NewsUseCase newsUseCase ; 
  List<SourcesEntity>? sources; 
  int selectedIndex  = 0 ;

  SourcesCubit({required this.newsUseCase}) : super(SourcesInitial());


void loadData(String categoryId ,{int newIndex = 0}) async {
  sources = null ;
   emit(SourcesLoading());
    if (sources == null) { 
      var either = await newsUseCase.invoke(categoryId);
      either.fold(
        (error) {
          emit(SourcesError(failures: error));
        }, 
        (response) {
          sources = response.sources;
          selectedIndex = newIndex;
          emit(SourcesLoaded(sources: response.sources!, selectedIndex: selectedIndex));
        }
      );
    } else {
      changeTab(newIndex);
    }
  }
  void changeTab(int index) {
    if (sources != null && sources!.isNotEmpty) {
      selectedIndex = index;
      emit(SourcesLoaded(sources: sources!, selectedIndex: selectedIndex));
    }
  } 
  
   int selectedMenuItem = HomeDrawer.categories ;
  void onSideFunctionClick (int newSideMenuItem){
  selectedMenuItem = newSideMenuItem ;
   
   if (newSideMenuItem == HomeDrawer.categories) {
    selectedCategory = null;
  }
  // todo : i will try this function 
   emit(SourcesLoaded(sources: sources!, selectedIndex: selectedIndex));

  }

    CategoryModel? selectedCategory ;
void onCategoryItemClick(CategoryModel newCategory) {
  if (selectedCategory?.id != newCategory.id) {
    selectedCategory = newCategory;
    loadData(newCategory.id, newIndex: 0); 
  }
}
    


}

