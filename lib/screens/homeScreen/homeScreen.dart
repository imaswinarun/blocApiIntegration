import 'package:apiTask/model/apiListDataModel.dart';
import 'package:apiTask/screens/homeScreen/bloc/homeScreen_list_bloc.dart';
import 'package:apiTask/screens/homeScreen/bloc/homeScreen_list_event.dart';
import 'package:apiTask/screens/homeScreen/networkBloc/network_bloc.dart';
import 'package:apiTask/utils/customNetworkImage.dart';
import 'package:apiTask/utils/customText.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/homeScreen_list_state.dart';
import 'networkBloc/network_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenListBloc listApiBloc;
  late NetworkBloc networkBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    listApiBloc = BlocProvider.of(context);
    networkBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Assignment"),
      ),
      body: BlocListener(
        bloc: networkBloc,
        listener: (context, state) {
          if (state is NetworkDisconnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: CustomText(
                "Network Offline",
                color: Colors.white,
              ),
            ));
          } else if (state is NetworkConectedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: CustomText(
                "Network Online",
                color: Colors.white,
              ),
            ));
          }
        },
        child: BlocConsumer(
          bloc: listApiBloc,
          listener: (context, state) {
            if (state is HomeScreenNextPageLoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Row(
                  children: [
                    SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: CircularProgressIndicator()),
                    Text("\t  Loading")
                  ],
                ),
              ));
            }
          },
          builder: (context, state) {
            return _buildBody(state);
          },
        ),
      ),
    );
  }

  Widget _buildBody(Object? state) {
    if (state is HomeScreenListInitialState ||
        state is HomeScreenListLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is HomeScreenListFetchedState ||
        state is HomeScreenRefreshListFetchedState ||
        state is HomeScreenNextPageLoadingState) {
      return _buildList();
    } else {
      return buildEmptyList();
    }
  }

  Container buildEmptyList() {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                listApiBloc.add(HomeScreenListRefreshEvent());
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.blue,
              ),
            ),
            CustomText("\t\tTry Again"),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          Duration(seconds: 1),
          () {
            listApiBloc.add(HomeScreenListRefreshEvent());
          },
        );
      },
      child: ListView.builder(
          controller: _scrollController
            ..addListener(() {
              if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent &&
                  !listApiBloc.loading &&
                  listApiBloc.nextPage &&
                  networkBloc.connection != ConnectivityResult.none) {
                listApiBloc.loading = true;
                listApiBloc.add(HomeScreenListFetchNextPageEvent());
              }
            }),
          itemCount: listApiBloc.apiListDataModel.length,
          itemBuilder: (context, index) {
            return _buildListItem(listApiBloc.apiListDataModel[index]);
          }),
    );
  }

  Widget _buildListItem(ApiListDataModel listData) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomNetworkImage(listData.avatar),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(listData.id.toString()),
                CustomText(listData.firstName + ' ' + listData.lastName),
                CustomText(listData.email),
              ],
            )
          ],
        ),
      ),
    );
  }
}
