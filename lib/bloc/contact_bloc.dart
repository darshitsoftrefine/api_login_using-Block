import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_using_block/data/model.dart';
import 'package:equatable/equatable.dart';

import '../data/repository.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactRepository repository;


  ContactBloc({required this.repository}) : super(ContactInitialState()) {
    on((event, emit) async {
      if(event is FetchContactEvent) {
        ContactPerson contDetails = await repository.getcontDetails() as ContactPerson;
        emit(ContactLoadedState(contDetails: contDetails));
      }
        else if(event is ContactErrorState){
          emit(ContactErrorState(message: "Error"));
      }
    });
  }

  ContactState get initialState => ContactInitialState();

}