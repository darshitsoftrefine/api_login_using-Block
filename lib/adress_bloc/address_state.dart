import 'package:equatable/equatable.dart';

import '../data/model.dart';

abstract class AddressState extends Equatable {}

class AddressInitialState extends AddressState {
  @override
  List<Object> get props => [];
}

class AddressLoadingState extends AddressState {
  @override
  List<Object> get props => [];
}

class AddressLoadedState extends AddressState {
  @override
  Address adrDetails;
  AddressLoadedState({
    required this.adrDetails,
  });

  List<Object> get props => throw UnimplementedError();
}

class AddressErrorState extends AddressState {
  String message;
  AddressErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}