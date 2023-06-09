import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_using_block/data/model.dart';
import 'package:equatable/equatable.dart';

import '../data/repository.dart';
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  ContactRepository repository;


  AddressBloc({required this.repository}) : super(AddressInitialState()) {
    on((event, emit) async {
      if(event is FetchAddressEvent) {
        Address adrDetails = await repository.getadrDetails() as Address;
        emit(AddressLoadedState(adrDetails: adrDetails));
      }
      else if(event is AddressErrorState){
        emit(AddressErrorState(message: "Error"));
      }
    });
  }

  AddressState get initialState => AddressInitialState();

}