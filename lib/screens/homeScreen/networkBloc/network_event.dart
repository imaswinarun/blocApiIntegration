import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';


class NetworkEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkistenConnectionEvent extends NetworkEvent {}

class NetworkConnectionChangedEvent extends NetworkEvent {
  final ConnectivityResult connection;
  NetworkConnectionChangedEvent(this.connection);
}
