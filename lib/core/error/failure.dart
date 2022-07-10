import 'package:equatable/equatable.dart';
import 'package:social/core/messages/fialur_messages.dart';

abstract class Failure extends Equatable {}

class OffLineFialur extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFialur extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFialur extends Failure {
  @override
  List<Object?> get props => [];
}

 String mapFialurToMessage({required Failure fialur}) {
    switch (fialur.runtimeType) {
      case ServerFialur:
        return fialurServerMessage;
      case OffLineFialur:
        return fialurOffLineMessage;
      case EmptyCacheFialur:
        return fialurEmptyMessage;
      default:
        return "unexpected errpr, please try again later ...";
    }
  }