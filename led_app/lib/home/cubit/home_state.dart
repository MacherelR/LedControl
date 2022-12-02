part of 'home_cubit.dart';

enum HomeTab { main, settings }

class HomeState {
  const HomeState({this.tab = HomeTab.main});
  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
