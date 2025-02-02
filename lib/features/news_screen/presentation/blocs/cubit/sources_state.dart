part of 'sources_cubit.dart';

@immutable
sealed class SourcesState {}

final class SourcesInitial extends SourcesState {}
final class SourcesLoaded extends SourcesState {
  List<SourcesEntity>? sources ;
  int selectedIndex ;
  SourcesLoaded({required this.sources , this.selectedIndex = 0});

}
final class SourcesError extends SourcesState {
  Failures failures ; 
  SourcesError({required this.failures});
}
final class SourcesLoading extends SourcesState {
}

//final class SourcesLoaded extends SourcesState {
//  List<ArticlesEntity>? articale ;
 // SourcesLoaded({required this.articale });
//}


