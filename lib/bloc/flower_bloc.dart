import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'flower_event.dart';
part 'flower_state.dart';

class FlowerBloc extends Bloc<FlowerEvent, FlowerState> {
  FlowerBloc() : super(MyblocInitial()) {
    on<ApiCallEventTrigerred>((event, emit) async {
      emit(MyblocLoading());
      // var apiList = await apiService.fetchDataFromApi();
      // emit(MyblocLoaded(apiList: apiList));
    });
  }
}
