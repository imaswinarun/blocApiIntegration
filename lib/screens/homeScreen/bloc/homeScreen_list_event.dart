import 'package:equatable/equatable.dart';

class HomeScreenListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeScreenListInitialLoadEvent extends HomeScreenListEvent{}

class HomeScreenListFetchNextPageEvent extends HomeScreenListEvent{}

class HomeScreenListRefreshEvent extends HomeScreenListEvent{}
