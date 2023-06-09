import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}
class FetchContactEvent extends ContactEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
