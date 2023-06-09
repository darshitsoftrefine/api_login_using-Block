import 'package:equatable/equatable.dart';

import '../data/model.dart';

abstract class ContactState extends Equatable {}

class ContactInitialState extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoadingState extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoadedState extends ContactState {
  @override
  ContactPerson contDetails;
  ContactLoadedState({
    required this.contDetails,
  });

  List<Object> get props => throw UnimplementedError();
}

class ContactErrorState extends ContactState {
  String message;
  ContactErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}