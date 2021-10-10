import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(NetworkInitialState());
  late StreamSubscription _subscription;
  late ConnectivityResult connection;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is NetworkistenConnectionEvent) {
      _subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
        connection = result;
        add(NetworkConnectionChangedEvent(result));
      });
    }
    if (event is NetworkConnectionChangedEvent) {
      if (event.connection == ConnectivityResult.none) {
        yield NetworkDisconnectedState();
      } else {
        yield NetworkConectedState();
      }
    }
  }
}
