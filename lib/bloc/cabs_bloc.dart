import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cabs_event.dart';
part 'cabs_state.dart';

class CabsBloc extends Bloc<CabsEvent, CabsState> {
  CabsBloc() : super(CabsInitial()) {
    on<CabsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}