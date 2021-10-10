import 'package:equatable/equatable.dart';

class NetworkState extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkInitialState extends NetworkState {}

class NetworkConectedState extends NetworkState {}

class NetworkDisconnectedState extends NetworkState {}
