part of 'flower_bloc.dart';

@immutable
abstract class FlowerState extends Equatable {}

class MyblocInitial extends FlowerState {
  @override
  List<Object?> get props => [];
}

class MyblocLoading extends FlowerState {
  @override
  List<Object?> get props => [];
}

class MyblocLoaded extends FlowerState {
  var apiList;
  MyblocLoaded({this.apiList});

  @override
  List<Object?> get props => [apiList];
}

class MyblocError extends FlowerState {
  @override
  List<Object?> get props => [];
}
