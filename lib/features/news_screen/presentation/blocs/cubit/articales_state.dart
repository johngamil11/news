part of 'articales_cubit.dart';

@immutable
sealed class ArticalesState {}

final class ArticalesInitial extends ArticalesState {}
final class ArticalesLoading extends ArticalesState {}
final class ArticalesError extends ArticalesState {
  Failures failures ; 
  ArticalesError({required this.failures});
}
final class ArticalesLoaded extends ArticalesState {
  List<ArticlesEntity>? articles ;
  ArticalesLoaded({required this.articles});
}
