import 'package:equatable/equatable.dart';

class HomeScreenListState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeScreenListInitialState extends HomeScreenListState {}

class HomeScreenListLoadingState extends HomeScreenListState {}

class HomeScreenNextPageLoadingState extends HomeScreenListState {}

class HomeScreenListFetchedState extends HomeScreenListState {}

class HomeScreenRefreshListFetchedState extends HomeScreenListState {}

class HomeScreenListEmptyState extends HomeScreenListState {}
