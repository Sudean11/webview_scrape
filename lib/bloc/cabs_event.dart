part of 'cabs_bloc.dart';

@immutable
abstract class CabsEvent {}

class StartScrape extends CabsEvent {}

class SetToBloc extends CabsEvent {}
