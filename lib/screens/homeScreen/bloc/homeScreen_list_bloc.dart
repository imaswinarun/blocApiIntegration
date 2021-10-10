import 'package:apiTask/model/apiListDataModel.dart';
import 'package:apiTask/screens/homeScreen/bloc/homeScreen_list_event.dart';
import 'package:apiTask/screens/homeScreen/bloc/homeScreen_list_state.dart';
import 'package:apiTask/utils/dbHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenListBloc
    extends Bloc<HomeScreenListEvent, HomeScreenListState> {
  HomeScreenListBloc() : super(HomeScreenListInitialState());

  List<ApiListDataModel> apiListDataModel = [];
  int page = 1;
  bool nextPage = true;
  bool loading = false;

  @override
  Stream<HomeScreenListState> mapEventToState(
      HomeScreenListEvent event) async* {
    if (event is HomeScreenListInitialLoadEvent) {
      yield HomeScreenListLoadingState();
      apiListDataModel = await DbHelper().getUserData(page++);
      if (apiListDataModel.isEmpty) {
        yield HomeScreenListEmptyState();
      } else {
        yield HomeScreenListFetchedState();
      }
    } else if (event is HomeScreenListFetchNextPageEvent) {
      yield HomeScreenNextPageLoadingState();
      List<ApiListDataModel> apiListNextPage =
          await DbHelper().getUserData(page++);
      apiListNextPage.isEmpty
          ? nextPage = false
          : apiListDataModel.addAll(apiListNextPage);
      loading = false;
      yield HomeScreenListFetchedState();
    } else if (event is HomeScreenListRefreshEvent) {
      yield HomeScreenListLoadingState();
      page = 1;
      nextPage = true;
      apiListDataModel.clear();
      apiListDataModel = await DbHelper().getUserData(page++);
      if (apiListDataModel.isEmpty) {
        yield HomeScreenListEmptyState();
      } else {
        yield HomeScreenRefreshListFetchedState();
      }
    }
  }
}
