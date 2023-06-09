import 'package:equatable/equatable.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();
}
class FetchAddressEvent extends AddressEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
